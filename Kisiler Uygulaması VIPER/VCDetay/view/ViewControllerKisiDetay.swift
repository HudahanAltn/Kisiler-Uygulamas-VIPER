//
//  ViewControllerKisiDetay.swift
//  Kisiler Uygulaması VIPER
//
//  Created by Hüdahan Altun on 25.09.2022.
//

import UIKit

class ViewControllerKisiDetay: UIViewController {

    @IBOutlet weak var kisiAdLabel: UILabel!
    
    @IBOutlet weak var kisiTelLabel: UILabel!
    
    var PressenterVCDetayProtocolNesnesi:ViewVCDetayToPresenterVCDetay?
  
    var indexxVCDetay:Int?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        PressenterVCDetayProtocolNesnesi?.tumKisilerAlVCPresent()
        
        RouterVCDeay.createVCDetayModule(Ref: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        PressenterVCDetayProtocolNesnesi?.tumKisilerAlVCPresent()
        
    }
    

}

extension ViewControllerKisiDetay:PresenterVCDetayToViewVCDetay{
    
    func ViewVCDetayaVeriGonder(kisilerListesi: Array<Kisiler>) {
        
        let gelenKisi = kisilerListesi[indexxVCDetay!]
        
        kisiAdLabel.text = "\(gelenKisi.getKisi_ad()!)"
        kisiTelLabel.text = "\(gelenKisi.getKisi_tel()!)"
        
    }
    
 
    
    
}
