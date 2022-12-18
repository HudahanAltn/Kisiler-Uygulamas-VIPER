//
//  RouterVC.swift
//  Kisiler Uygulaması VIPER
//
//  Created by Hüdahan Altun on 25.09.2022.
//

import Foundation

class RouterVC:PresenterVCToRouterVC{
    
    
    static func createVCModule(ref: ViewController) {
        
        let presenterr = PresenterVC()
        
        ref.presenterVCProtocolNesnesi = presenterr
        
        ref.presenterVCProtocolNesnesi?.interactorVC = InteractorVC()
        
        ref.presenterVCProtocolNesnesi?.viewVC = ref
        
        ref.presenterVCProtocolNesnesi?.interactorVC?.presenterVC = presenterr
    }
    
    
    
    
    
}
