//
//  Storm.swift
//  Storm Viewer
//
//  Created by Aasem Hany on 22/01/2023.
//

import Foundation

struct Storm:Codable {
    let stormImageFileName:String
    var viewCounter:Int
    
    
    mutating func updateViewCounter() {
        viewCounter += 1
    }
}
