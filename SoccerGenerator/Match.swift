//
//  Match.swift
//  SoccerGenerator
//
//  Created by Carlos Pienovi on 7/11/17.
//  Copyright © 2017 Carlos Pienovi. All rights reserved.
//

import Foundation

class Match {
    
    var local: NewPlayer
    var away: NewPlayer
    var localGoals: Int
    var awayGoals: Int
    var played: Bool
    
    init(local: NewPlayer, away: NewPlayer) {
        self.local = local
        self.away = away
        self.localGoals = 0
        self.awayGoals = 0
        self.played = false
    }
    
}
