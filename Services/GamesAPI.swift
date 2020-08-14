//
//  GameAPI.swift
//  GameCenter
//
//  Created by rifat khadafy on 14/08/20.
//  Copyright © 2020 rifat khadafy. All rights reserved.
//

import Foundation
import Combine

enum GamesApi {
    private static let base = URL(string: "https://api.rawg.io/api/")!
    private static let call = Call()
    
    static func gamePlatform(id: String = "18") -> AnyPublisher<Games<Game>, Error> {
        let request = URLComponents(url: URL(string: "https://api.rawg.io/api/games?platforms=7")!, resolvingAgainstBaseURL: true)!
            .request
        return call.run(request!)
    }
}

private extension URLComponents {
    var request: URLRequest? {
        url.map { URLRequest.init(url: $0) }
    }
}

