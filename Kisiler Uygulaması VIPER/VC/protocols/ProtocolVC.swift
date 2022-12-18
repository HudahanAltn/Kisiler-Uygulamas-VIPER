//
//  ProtocolVC.swift
//  Kisiler Uygulaması VIPER
//
//  Created by Hüdahan Altun on 25.09.2022.
//

import Foundation


protocol PresenterVCToInteractorVC{
    
    var presenterVC:InteractorVCToPresenterVC?{set get}
    
    
    func TumKisileriAl()
    func KisiSil(kisi_id:Int)
    func kisiAra(kisi_ad:String)
}

protocol ViewVCToPresenterVC{
    
    var interactorVC:PresenterVCToInteractorVC?{set get}
    var viewVC:PresenterVCToViewVC?{set get}
    
    func TumKisileriAlPresenter()
    func KisiSilPresenter(kisi_id:Int)
    func kisiAraPresenter(kisi_ad:String)
    
}

protocol InteractorVCToPresenterVC{
    
    func presenterVCyeVeriGönder(kisilerListesi:Array<Kisiler>)
    
}

protocol PresenterVCToViewVC{
    
    func viewVCyeVeriGönder(kisilerListesi:Array<Kisiler>)
}


protocol PresenterVCToRouterVC{
    
    static func createVCModule(ref:ViewController)
    
}
