//
//  RouterVCDetay.swift
//  Kisiler Uygulaması VIPER
//
//  Created by Hüdahan Altun on 25.09.2022.
//

import Foundation


class RouterVCDeay:PresenterVCDetayToRouterVCDetay{
    
    
    static func createVCDetayModule(Ref: ViewControllerKisiDetay) {
        
        let presenterrVCDetay = PresenterVCDetay()
        
        Ref.PressenterVCDetayProtocolNesnesi = presenterrVCDetay
        
        Ref.PressenterVCDetayProtocolNesnesi?.interactorVCDetay = InteractorVCDetay()
        
        
        Ref.PressenterVCDetayProtocolNesnesi?.viewVCDetay = Ref
        
        Ref.PressenterVCDetayProtocolNesnesi?.interactorVCDetay?.presenterVCDetay = presenterrVCDetay
    }
    
    
    
    
}
