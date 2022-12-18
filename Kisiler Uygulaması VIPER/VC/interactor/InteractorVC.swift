//
//  InteractorVC.swift
//  Kisiler Uygulaması VIPER
//
//  Created by Hüdahan Altun on 25.09.2022.
//

import Foundation


class InteractorVC:PresenterVCToInteractorVC{
    
    var presenterVC: InteractorVCToPresenterVC?
    

    let db:FMDatabase?

    init(){

        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first

        let veritabanıURL = URL(fileURLWithPath: hedefYol!).appendingPathComponent("rehber.sqlite")

        db = FMDatabase(path: veritabanıURL.path)

    }
    
    func TumKisileriAl() {
     
        var gelenKisilerListesiVC:[Kisiler] = [Kisiler] ()
        
        
        
        db?.open()
        
        do{
            
            let rs = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            
            while(rs.next()){
                
                let gelenKisiVC = Kisiler(kisi_id: Int(rs.string(forColumn:"kisi_id"))!
                                          , kisi_ad: rs.string(forColumn:"kisi_ad")!
                                          , kisi_tel: rs.string(forColumn:"kisi_tel")!)
                
                gelenKisilerListesiVC.append(gelenKisiVC)
                
            }
            
            
            presenterVC?.presenterVCyeVeriGönder(kisilerListesi: gelenKisilerListesiVC)
            
            print("InteractorVC veritabanından tüm kişiler alındı!")
        }catch{
            
            print(" InteractorVC veritabanından tüm veriler alınamadı")
            
        }
        
        db?.close()
      
        
        print("presenterVC ye veri gönderildi")
    }
    
    func KisiSil(kisi_id: Int) {
        
        db?.open()
        
        do{
            try db!.executeUpdate("DELETE FROM kisiler WHERE kisi_id = ?", values: [kisi_id])
            TumKisileriAl()
            print("InteractorVC kisi silme başarılı")
            
        }catch{
            print("InteractorVC kisi silme başarısız!")
        }
        
        db?.close()
    }
    
    func kisiAra(kisi_ad: String) {
        
        var aramaylaGelenKisiListesi = [Kisiler]()
        
        db?.open()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_ad like '%\(kisi_ad)%'", values: nil)
            
            while rs.next()  {
                let gelenKisi = Kisiler(kisi_id: Int(rs.string(forColumn: "kisi_id"))!,
                                   kisi_ad: rs.string(forColumn: "kisi_ad")!,
                                   kisi_tel: rs.string(forColumn: "kisi_tel")!)
                aramaylaGelenKisiListesi.append(gelenKisi)
            }
            
            presenterVC?.presenterVCyeVeriGönder(kisilerListesi: aramaylaGelenKisiListesi)
            
            print("Interactor VC kisi arama başarılı!")
        }catch{
            print("Interactor VC kisi arama başarısız!")
        }
        
        db?.close()
    }
    
    
    
}
