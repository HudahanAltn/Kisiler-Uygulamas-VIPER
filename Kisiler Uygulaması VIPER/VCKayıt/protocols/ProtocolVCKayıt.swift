//
//  ProtocolVCKayıt.swift
//  Kisiler Uygulaması VIPER
//
//  Created by Hüdahan Altun on 25.09.2022.
//

import Foundation


protocol PresenterVCKayıtToInteractorVCKayıt{
    
    func kisiKaydet(kisi_ad:String,kisi_tel:String)
    
}

protocol ViewVCKayıtToPresenterVCKayıt{
    
    var interactorVCKayıt:PresenterVCKayıtToInteractorVCKayıt?{set get}
    
    func kisiKaydetPresenter(kisi_ad:String,kisi_tel:String)
    
}


protocol PresenterVCKayıtToRouterVCKayıt{
    
    
    static func createVCKayitModule(ref:ViewControllerKisiKayit)
    
}
