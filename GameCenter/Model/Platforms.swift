//
//  Platforms.swift
//  GameCenter
//
//  Created by rifat khadafy on 24/08/20.
//  Copyright © 2020 rifat khadafy. All rights reserved.
//

import Foundation

struct Platform : Hashable {
    let id,name,image : String
}

var dataPlatforms : [Platform] = [
    Platform(id: "18",name: "Playstation 4", image: "Playstation"),
    Platform(id: "4",name: "PC", image: "PC"),
    Platform(id: "1",name: "Xbox One", image: "Xbox"),
    Platform(id: "7",name: "Nintendo Switch", image: "Switch"),
]
