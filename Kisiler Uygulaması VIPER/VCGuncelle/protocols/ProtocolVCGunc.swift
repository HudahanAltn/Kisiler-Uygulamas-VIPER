//
//  ProtocolVCGunc.swift
//  Kisiler Uygulaması VIPER
//
//  Created by Hüdahan Altun on 25.09.2022.
//

import Foundation


protocol PresenterVCGuncToInteractorVCGunc{
    
    var presenterVCGunc:InteractorVCGuncToPresenterVCGunc?{set get}
    
    func kisiGuncelle(kisi_id:Int,kisi_ad:String,kisi_tel:String)
    
    func tumKisileriAlVCGunc()
}


protocol ViewVCGuncToPresenterVCGunc{
    
    var interactorVCGunc:PresenterVCGuncToInteractorVCGunc?{set get}
    var viewVCGunc:PresenterVCGuncToViewVCGunc?{set get}
    
    func kisiGuncellePresenterGunc(kisi_id:Int,kisi_ad:String,kisi_tel:String)
    func tumKisileriAlPresenterVCGunc()
}

protocol InteractorVCGuncToPresenterVCGunc{
    
    func presenterVCGunceVeriGonder(kisilerListesi:Array<Kisiler>)
}

protocol PresenterVCGuncToViewVCGunc{
    
    func viewVCGunceVeriGonder(kisilerListesi:Array<Kisiler>)
}

protocol PresenterVCGuncToRouterVCGunc{
    
    static func createVCGuncModule(reff:ViewControllerKisiGuncelle)
}
