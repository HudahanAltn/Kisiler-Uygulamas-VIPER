//
//  ViewControllerKisiKayit.swift
//  Kisiler Uygulaması VIPER
//
//  Created by Hüdahan Altun on 25.09.2022.
//

import UIKit

class ViewControllerKisiKayit: UIViewController {

    @IBOutlet weak var kisiAdTextField: UITextField!
    
    
    @IBOutlet weak var kisiTelTextField: UITextField!
    
    var presenterVCKayıtProtocolNesnesi:ViewVCKayıtToPresenterVCKayıt?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        kisiAdTextField.autocorrectionType = .no
        kisiAdTextField.autocapitalizationType = .none
        kisiTelTextField.autocorrectionType = .no
        kisiTelTextField.autocapitalizationType = .none
        
        RouterVCKayıt.createVCKayitModule(ref: self)
    }
    

 
    @IBAction func kisiKaydet(_ sender: Any) {
        
    
        if let kad = kisiAdTextField.text , let ktel = kisiTelTextField.text{
            
            presenterVCKayıtProtocolNesnesi?.kisiKaydetPresenter(kisi_ad: kad, kisi_tel: ktel)
        }
    }
    
}
