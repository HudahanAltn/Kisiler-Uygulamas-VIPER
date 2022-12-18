//
//  ViewController.swift
//  Kisiler Uygulaması VIPER
//
//  Created by Hüdahan Altun on 25.09.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var searchBarr: UISearchBar!
    
    @IBOutlet weak var tableViewKisi: UITableView!
    
    var presenterVCProtocolNesnesi:ViewVCToPresenterVC?
    
    var gelenKisilerListesiVC:[Kisiler] = [Kisiler] ()
    
    var aramaYapılıyorMu:Bool = false
    var aramaKelimesi:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarr.autocorrectionType = .no
        searchBarr.autocapitalizationType = .none
        searchBarr.delegate = self
        tableViewKisi.delegate = self
        tableViewKisi.dataSource = self
        
        veritabanıKopyala()
        RouterVC.createVCModule(ref: self)
    }

 

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexx = sender as? Int{
            
            if segue.identifier == "toDetay"{
                
                let gidilecekVC = segue.destination as? ViewControllerKisiDetay
                
                gidilecekVC?.indexxVCDetay = indexx
            }
            if segue.identifier == "toGuncelle"{
                
                let gidilecekVC = segue.destination as! ViewControllerKisiGuncelle
                
                gidilecekVC.indexxVCGunc = indexx
            }
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        if aramaYapılıyorMu{
            
            presenterVCProtocolNesnesi?.kisiAraPresenter(kisi_ad: aramaKelimesi!)
            
        }else{
            
            presenterVCProtocolNesnesi?.TumKisileriAlPresenter()
        }
            
        
    }
    
    func veritabanıKopyala(){
        
        let bundleYolu = Bundle.main.path(forResource: "rehber", ofType: ".sqlite")
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        
        let kopyala = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        
        if fileManager.fileExists(atPath: kopyala.path){
            
            print("veritabanı zaten kopyalandı")
            print(kopyala)
            
        }else{
            
            
            do{
                
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyala.path)
                
                print("VC veritabanı başarıyla kopyalandı!")
            }catch{
                
                
                print("VC veritabanı kopyalamada hata!")
            }
        }
        
    }
}

extension ViewController:PresenterVCToViewVC{
    
    
    func viewVCyeVeriGönder(kisilerListesi: Array<Kisiler>) {
        
        self.gelenKisilerListesiVC = kisilerListesi
        self.tableViewKisi.reloadData()
        
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return gelenKisilerListesiVC.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let gelenKisi = gelenKisilerListesiVC[indexPath.row]
        
        let cell = tableViewKisi.dequeueReusableCell(withIdentifier: "h1",for:indexPath) as! TableViewCellKisi
        
        cell.labelKisi.text = "\(gelenKisi.getKisi_ad()!) - \(gelenKisi.getKisi_tel()!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silButton = UIContextualAction(style: .destructive, title: "Sil"){
            
            (contextualAction,view,boolValue) in
            
            let silinecekKisi = self.gelenKisilerListesiVC[indexPath.row]
            self.presenterVCProtocolNesnesi?.KisiSilPresenter(kisi_id: silinecekKisi.getKisi_id()!)
            
        }
        
        let guncelleButton = UIContextualAction(style: .normal, title: "Guncelle"){
            
            (contextualAction,view,boolValue) in
            
            self.performSegue(withIdentifier: "toGuncelle", sender: indexPath.row)
            
        }
        
        return UISwipeActionsConfiguration(actions: [silButton,guncelleButton])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        performSegue(withIdentifier: "toDetay", sender: indexPath.row)
        
        print("\(gelenKisilerListesiVC[indexPath.row].getKisi_ad()!) seçildi")
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print("aranan kelime : \(searchText)")
        
        
        aramaKelimesi = searchText
        
        if searchText == "" {
            
            aramaYapılıyorMu = false
        }else{
            
            aramaYapılıyorMu = true
        }
        
        presenterVCProtocolNesnesi?.kisiAraPresenter(kisi_ad: searchText)
    }
    
}
