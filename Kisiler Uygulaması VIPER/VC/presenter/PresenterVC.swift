//
//  PresenterVC.swift
//  Kisiler Uygulaması VIPER
//
//  Created by Hüdahan Altun on 25.09.2022.
//

import Foundation


class PresenterVC:ViewVCToPresenterVC{
    
    var interactorVC: PresenterVCToInteractorVC?
    
    var viewVC: PresenterVCToViewVC?
    
    func TumKisileriAlPresenter() {
        
        interactorVC?.TumKisileriAl()
    }
    
    func KisiSilPresenter(kisi_id: Int) {
        interactorVC?.KisiSil(kisi_id: kisi_id)
    }
    
    func kisiAraPresenter(kisi_ad: String) {
        interactorVC?.kisiAra(kisi_ad: kisi_ad)
    }
    
    
    
}

extension PresenterVC:InteractorVCToPresenterVC{
    func presenterVCyeVeriGönder(kisilerListesi: Array<Kisiler>) {
        
        viewVC?.viewVCyeVeriGönder(kisilerListesi: kisilerListesi)
    }
    
    
    
}
