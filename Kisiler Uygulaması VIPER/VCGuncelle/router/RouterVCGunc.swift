//
//  RouterVCGunc.swift
//  Kisiler Uygulaması VIPER
//
//  Created by Hüdahan Altun on 25.09.2022.
//

import Foundation

class RouterVCGunc:PresenterVCGuncToRouterVCGunc{
    
    
    static func createVCGuncModule(reff: ViewControllerKisiGuncelle) {
        
        
        let presenterrVCGunc = PresenterVCGunc()
        
        reff.presenterVCGuncProtocolNesnesi = presenterrVCGunc
        
        reff.presenterVCGuncProtocolNesnesi?.interactorVCGunc = InteractorVCGunc()
        
        reff.presenterVCGuncProtocolNesnesi?.viewVCGunc = reff
        
      
        reff.presenterVCGuncProtocolNesnesi?.interactorVCGunc?.presenterVCGunc =  presenterrVCGunc
    }
    
    
    
}
