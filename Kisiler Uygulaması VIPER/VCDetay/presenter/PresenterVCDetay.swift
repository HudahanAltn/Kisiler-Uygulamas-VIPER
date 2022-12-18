//
//  PresenterVCDetay.swift
//  Kisiler Uygulaması VIPER
//
//  Created by Hüdahan Altun on 25.09.2022.
//

import Foundation


class PresenterVCDetay:ViewVCDetayToPresenterVCDetay{
    
    var interactorVCDetay: PresenterVCDetayToInteractorVCDetay?
    
    var viewVCDetay: PresenterVCDetayToViewVCDetay?
    
    func tumKisilerAlVCPresent() {
        interactorVCDetay?.tumKisilerAlVCDetay()
    }
    
}

extension PresenterVCDetay:InteractorVCDetayToPresenterVCDetay{
    
    func PresenterVCDetayaVeriGonder(kisilerListesi: Array<Kisiler>) {
        viewVCDetay?.ViewVCDetayaVeriGonder(kisilerListesi: kisilerListesi)
    }
    
    
   
    
    
    
}
