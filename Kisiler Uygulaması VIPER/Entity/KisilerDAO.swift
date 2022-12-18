//
//  KisilerDAO.swift
//  Kisiler Uygulaması VIPER
//
//  Created by Hüdahan Altun on 27.09.2022.
//

import Foundation


class KisilerDAO{
    
    let db:FMDatabase?
    
    init(){
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        
        let veritabanıURL = URL(fileURLWithPath: hedefYol!).appendingPathComponent("rehber.sqlite")
        
        db = FMDatabase(path: veritabanıURL.path)
        
    }
}
