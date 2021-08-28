//
//  BoadingScreen.swift
//  BoadingScreen
//
//  Created by nyannyan0328 on 2021/08/28.
//

import SwiftUI

struct BoadingScreen: Identifiable {
    
    var id = UUID().uuidString
  
    var image : String
    var title : String
    var description : String
    
    
}
let title = "Easy Payments with \nWallestroy"

let description = "Small business can recive device \npayment super fast and super easy"


var boadingScreens : [BoadingScreen] = [


BoadingScreen(image: "screen1", title: title, description: description),
BoadingScreen(image: "screen2", title: title, description: description),
BoadingScreen(image: "screen3", title: title, description: description),
BoadingScreen(image: "screen4", title: title, description: description),

]


