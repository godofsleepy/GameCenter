//
//  DetailMap.swift
//  GameCenter
//
//  Created by rifat khadafy on 19/08/20.
//  Copyright © 2020 rifat khadafy. All rights reserved.
//

import Foundation

struct GameDetail  {
    let id : Int
    let name : String
    let released : String?
    let rating : Double
    let description  : String?
    let background_image : String?
    let parent_platforms : [platforms]
    let genres : [genre]
    
    init(game: Detail) {
        id = game.id
        name = game.name
        released = game.released
        rating = game.rating
        description = game.description
        background_image = game.background_image
        parent_platforms = game.parent_platforms
        genres = game.genres
    }
    
    public func getGenre() -> [String] {
        var genreArray : [String] = []
        for i in genres {
            genreArray.append(i.name)
        }
        return genreArray
    }
    
    public func getPlatform() -> [String] {
        var platformArray : [String] = []
        for i in parent_platforms {
            platformArray.append(i.platform.slug)
        }
        return platformArray
    }
}
