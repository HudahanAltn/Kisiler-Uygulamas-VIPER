//
//  RouterVCKayıt.swift
//  Kisiler Uygulaması VIPER
//
//  Created by Hüdahan Altun on 25.09.2022.
//

import Foundation


class RouterVCKayıt:PresenterVCKayıtToRouterVCKayıt{
    
    
    static func createVCKayitModule(ref: ViewControllerKisiKayit) {
        
        
        let presenterr = PresenterVCKayıt()
        
        ref.presenterVCKayıtProtocolNesnesi = presenterr
        
        ref.presenterVCKayıtProtocolNesnesi?.interactorVCKayıt = InteractorVCKAyıt()
        
        
        
    }
    
    
    
    
}
