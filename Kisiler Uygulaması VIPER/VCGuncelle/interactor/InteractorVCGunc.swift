//
//  InteractorVCGunc.swift
//  Kisiler Uygulaması VIPER
//
//  Created by Hüdahan Altun on 25.09.2022.
//

import Foundation


class InteractorVCGunc:PresenterVCGuncToInteractorVCGunc{
    
    var presenterVCGunc:InteractorVCGuncToPresenterVCGunc?
    
    let db:FMDatabase?

    init(){

        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first

        let veritabanıURL = URL(fileURLWithPath: hedefYol!).appendingPathComponent("rehber.sqlite")

        db = FMDatabase(path: veritabanıURL.path)

    }
    
    func tumKisileriAlVCGunc() {
    
        var gelenKisilerListesiVCGunc:[Kisiler] = [Kisiler] ()
        
        
        
        db?.open()
        
        do{
            
            let rs = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            
            while(rs.next()){
                
                let gelenKisiVCGunc = Kisiler(kisi_id: Int(rs.string(forColumn:"kisi_id"))!
                                          , kisi_ad: rs.string(forColumn:"kisi_ad")!
                                          , kisi_tel: rs.string(forColumn:"kisi_tel")!)
                
                gelenKisilerListesiVCGunc.append(gelenKisiVCGunc)
                
            }
            
            presenterVCGunc?.presenterVCGunceVeriGonder(kisilerListesi: gelenKisilerListesiVCGunc)
            
            print("InteractorVCGunc veritabanından tüm kişiler alındı!")
        }catch{
            
            print(" InteractorVCGunc veritabanından tüm veriler alınamadı")
            
        }
        
        KisilerDAO().db?.close()
      
        
        print("presenterVCGunc ye veri gönderildi")
        
    }
    
    
    
    func kisiGuncelle(kisi_id:Int ,kisi_ad: String, kisi_tel: String) {
        
        db?.open()
        
        do{
            try db!.executeUpdate("UPDATE kisiler SET kisi_ad = ? , kisi_tel = ? WHERE kisi_id = ?", values: [kisi_ad,kisi_tel,kisi_id])
            
            print("InteractorVCGunc kisi güncelleme başarılı!")
        }catch{
            print("InteractorVCGunc kisi güncelleme başarısız!")
            
        }
        
        db?.close()
        
    }
    
    
    
}
