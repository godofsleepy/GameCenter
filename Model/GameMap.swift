//
//  GameMap.swift
//  GameCenter
//
//  Created by rifat khadafy on 18/08/20.
//  Copyright © 2020 rifat khadafy. All rights reserved.
//

import Foundation

struct ListGame: Identifiable {
    let id : Int
    let name : String
    let rating : Double
    let released : String?
    let background_image : String?
    
    init(game: Game) {
        id = game.id
        name = game.name
        rating = game.rating
        released = game.released
        background_image = game.background_image
    }
}
