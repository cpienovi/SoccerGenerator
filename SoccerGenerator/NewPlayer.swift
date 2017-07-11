//
//  NewPlayer.swift
//  SoccerGenerator
//
//  Created by Carlos Pienovi on 7/10/17.
//  Copyright © 2017 Carlos Pienovi. All rights reserved.
//

import Foundation
import ObjectMapper

class NewPlayer: Mappable {
    
    var name : String?
    var team: String?

    init(name: String, team: String) {
        self.name = name
        self.team = team
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        name    <- map["name"]
        team    <- map["team"]
    }
    
}
