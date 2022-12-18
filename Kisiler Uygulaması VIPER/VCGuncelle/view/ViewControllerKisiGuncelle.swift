//
//  ViewControllerKisiGuncelle.swift
//  Kisiler Uygulaması VIPER
//
//  Created by Hüdahan Altun on 25.09.2022.
//

import UIKit

class ViewControllerKisiGuncelle: UIViewController {

    @IBOutlet weak var kisiAdTextField: UITextField!
    
    @IBOutlet weak var kisiTelTextField: UITextField!
    
    
    var presenterVCGuncProtocolNesnesi:ViewVCGuncToPresenterVCGunc?
    
    var GüncellenecekKisi:Kisiler?
    
    var indexxVCGunc:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenterVCGuncProtocolNesnesi?.tumKisileriAlPresenterVCGunc()
        
        RouterVCGunc.createVCGuncModule(reff: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        presenterVCGuncProtocolNesnesi?.tumKisileriAlPresenterVCGunc()
    }
    
    @IBAction func kisiGuncelle(_ sender: Any) {
        
        if let k = GüncellenecekKisi ,let kad = kisiAdTextField.text, let ktel = kisiTelTextField.text{
            
            presenterVCGuncProtocolNesnesi?.kisiGuncellePresenterGunc(kisi_id:k.getKisi_id()!,kisi_ad: kad, kisi_tel: ktel)
        }
    }
    
   

}

extension ViewControllerKisiGuncelle:PresenterVCGuncToViewVCGunc{
    
    func viewVCGunceVeriGonder(kisilerListesi: Array<Kisiler>) {
        
        let gelenKisi = kisilerListesi[indexxVCGunc!]
        GüncellenecekKisi = gelenKisi
        
        kisiAdTextField.text = "\(gelenKisi.getKisi_ad()!)"
        kisiTelTextField.text = "\(gelenKisi.getKisi_tel()!)"
    }
    
    
    
}
