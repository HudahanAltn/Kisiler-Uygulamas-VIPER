//
//  ProtocolVCDetay.swift
//  Kisiler Uygulaması VIPER
//
//  Created by Hüdahan Altun on 25.09.2022.
//

import Foundation


protocol PresenterVCDetayToInteractorVCDetay{
    
    var presenterVCDetay:InteractorVCDetayToPresenterVCDetay? {set get}
    
    func tumKisilerAlVCDetay()
    
}

protocol ViewVCDetayToPresenterVCDetay{
    
    var interactorVCDetay:PresenterVCDetayToInteractorVCDetay?{set get}
    var viewVCDetay:PresenterVCDetayToViewVCDetay?{set get}
    
    func tumKisilerAlVCPresent()
}

protocol InteractorVCDetayToPresenterVCDetay{
    
    
    func PresenterVCDetayaVeriGonder(kisilerListesi:Array<Kisiler>)
    
}

protocol PresenterVCDetayToViewVCDetay{
    
    func ViewVCDetayaVeriGonder(kisilerListesi:Array<Kisiler>)
    
}

protocol PresenterVCDetayToRouterVCDetay{
    
    static func createVCDetayModule(Ref:ViewControllerKisiDetay)
}
