//
//  InteractorVCKayıt.swift
//  Kisiler Uygulaması VIPER
//
//  Created by Hüdahan Altun on 25.09.2022.
//

import Foundation


class InteractorVCKAyıt:PresenterVCKayıtToInteractorVCKayıt{
    
    let db:FMDatabase?

    init(){

        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first

        let veritabanıURL = URL(fileURLWithPath: hedefYol!).appendingPathComponent("rehber.sqlite")

        db = FMDatabase(path: veritabanıURL.path)

    }
    
    func kisiKaydet(kisi_ad: String, kisi_tel: String) {
        
        db?.open()
        
        do{
            
            try db!.executeUpdate("INSERT INTO kisiler (kisi_ad,kisi_tel) VALUES (?,?)", values: [kisi_ad,kisi_tel])
            
            print("InteractorVCKayıt kisi kaydetme başarılı!")
            
        }catch{
            
            print("InteractorVCKayıt kisi kaydetme başarısız!")
        }
        
        db?.close()
    }

    
}
