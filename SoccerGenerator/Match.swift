//
//  Match.swift
//  SoccerGenerator
//
//  Created by Carlos Pienovi on 7/11/17.
//  Copyright © 2017 Carlos Pienovi. All rights reserved.
//

import Foundation
import ObjectMapper

class Match: Mappable {
    
    var local: NewPlayer? = nil
    var away: NewPlayer? = nil
    var localGoals: Int = 0
    var awayGoals: Int = 0
    var played: Bool = false
    
    init(local: NewPlayer, away: NewPlayer) {
        self.local = local
        self.away = away
        self.localGoals = 0
        self.awayGoals = 0
        self.played = false
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        local    <- map["local"]
        away    <- map["away"]
        localGoals    <- map["localGoals"]
        awayGoals    <- map["awayGoals"]
        played    <- map["played"]
    }
    
}
