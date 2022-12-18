//
//  Kisiler.swift
//  Kisiler Uygulaması
//
//  Created by Hüdahan Altun on 21.09.2022.
//

import Foundation

class Kisiler{
    
    private var kisi_id:Int?
    private var kisi_ad:String?
    private var kisi_tel:String?
    
    
    init(kisi_id:Int,kisi_ad:String,kisi_tel:String){
        
        self.kisi_id = kisi_id
        self.kisi_ad = kisi_ad
        self.kisi_tel = kisi_tel
    }
    
    
    func getKisi_id()->Int?{
        
        return kisi_id!
    }
    
    func getKisi_ad()->String?{
        
        return kisi_ad!
    }

    func getKisi_tel()->String?{
        
        return kisi_tel!
    }

}
