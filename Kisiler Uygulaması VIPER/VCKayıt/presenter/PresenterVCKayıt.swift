//
//  PresenterVCKayıt.swift
//  Kisiler Uygulaması VIPER
//
//  Created by Hüdahan Altun on 25.09.2022.
//

import Foundation


class PresenterVCKayıt:ViewVCKayıtToPresenterVCKayıt{
    
    
    var interactorVCKayıt: PresenterVCKayıtToInteractorVCKayıt?
    
    
    func kisiKaydetPresenter(kisi_ad: String, kisi_tel: String) {
        
        interactorVCKayıt?.kisiKaydet(kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
    
    
    
    
}
