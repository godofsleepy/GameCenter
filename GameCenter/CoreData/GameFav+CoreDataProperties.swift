//
//  GameFav+CoreDataProperties.swift
//  GameCenter
//
//  Created by rifat khadafy on 24/08/20.
//  Copyright © 2020 rifat khadafy. All rights reserved.
//
//

import Foundation
import CoreData


extension GameFav {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameFav> {
        return NSFetchRequest<GameFav>(entityName: "GameFav")
    }
    
    @NSManaged public var name: String?
    @NSManaged public var rating: Double
    @NSManaged public var id: Int64
    @NSManaged public var image: String?
    @NSManaged public var released: String?
    @NSManaged public var desc: String?
    @NSManaged public var plaform: [NSString]?
    @NSManaged public var genre: [NSString]?
    
    public var wrappedId: Int {
        Int(id)
    }
    
    
    public var wrappedName: String {
        name ?? "Unknown name"
    }
    
    public var wrappedRating: Double {
        rating
    }
    
    public var wrappedImage: String {
        image ?? "no image"
    }
    
    public var wrappedReleased: String {
        released ?? "uknown"
    }
    
    public var wrappedDesc: String {
        desc ?? "no desc"
    }
    
    public var genreArray: [String] {
        let set = genre as [String]? ?? []
        return set
    }
    
    public var platformArray: [String] {
        let set = plaform as [String]? ?? []
        return set
    }
}

