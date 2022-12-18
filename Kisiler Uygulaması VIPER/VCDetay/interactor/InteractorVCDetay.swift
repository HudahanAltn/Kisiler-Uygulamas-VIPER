//
//  InteractorVCDetay.swift
//  Kisiler Uygulaması VIPER
//
//  Created by Hüdahan Altun on 25.09.2022.
//

import Foundation

class InteractorVCDetay:PresenterVCDetayToInteractorVCDetay{

    var presenterVCDetay:InteractorVCDetayToPresenterVCDetay?
    
    let db:FMDatabase?

    init(){

        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first

        let veritabanıURL = URL(fileURLWithPath: hedefYol!).appendingPathComponent("rehber.sqlite")

        db = FMDatabase(path: veritabanıURL.path)

    }
    
    func tumKisilerAlVCDetay() {
        
        
        var gelenKisilerListesiVCDetay:[Kisiler] = [Kisiler] ()
        
        
        
        db?.open()
        
        do{
            
            let rs = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            
            while(rs.next()){
                
                let gelenKisiVCDetay = Kisiler(kisi_id: Int(rs.string(forColumn:"kisi_id"))!
                                          , kisi_ad: rs.string(forColumn:"kisi_ad")!
                                          , kisi_tel: rs.string(forColumn:"kisi_tel")!)
                
                gelenKisilerListesiVCDetay.append(gelenKisiVCDetay)
                
            }
            
            presenterVCDetay?.PresenterVCDetayaVeriGonder(kisilerListesi: gelenKisilerListesiVCDetay)
            
            print("InteractorVCDetay veritabanından tüm kişiler alındı!")
        }catch{
            
            print(" InteractorVCDEtay veritabanından tüm veriler alınamadı")
            
        }
        
        db?.close()
      
        
        print("presenterVCDetay ye veri gönderildi")
    }
    
    
}
