//
//  PresenterVCGunc.swift
//  Kisiler Uygulaması VIPER
//
//  Created by Hüdahan Altun on 25.09.2022.
//

import Foundation


class PresenterVCGunc:ViewVCGuncToPresenterVCGunc{
    
    
    var interactorVCGunc: PresenterVCGuncToInteractorVCGunc?
    var viewVCGunc: PresenterVCGuncToViewVCGunc?
    
    
    
    func tumKisileriAlPresenterVCGunc() {
        
        interactorVCGunc?.tumKisileriAlVCGunc()
    }
    
    
    
    func kisiGuncellePresenterGunc(kisi_id:Int,kisi_ad: String, kisi_tel: String) {
        
        interactorVCGunc?.kisiGuncelle(kisi_id:kisi_id,kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
    
    
}

extension PresenterVCGunc:InteractorVCGuncToPresenterVCGunc{
    
    func presenterVCGunceVeriGonder(kisilerListesi: Array<Kisiler>) {
        
        viewVCGunc?.viewVCGunceVeriGonder(kisilerListesi: kisilerListesi)
    }
    
    
    
}

