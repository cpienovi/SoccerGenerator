//
//  Position.swift
//  SoccerGenerator
//
//  Created by Carlos Pienovi on 7/11/17.
//  Copyright © 2017 Carlos Pienovi. All rights reserved.
//

import Foundation

public class Position {
    
    var team: String
    var played: Int
    var wins: Int
    var draws: Int
    var losses: Int
    var scored: Int
    var against: Int
    var difference: Int
    var points: Int
    
    init(team: String, wins: Int, draws: Int, losses: Int, scored: Int, against: Int) {
        self.team = team
        self.wins = wins
        self.draws = draws
        self.losses = losses
        self.scored = scored
        self.against = against
        
        self.played = wins + draws + losses
        self.difference = scored - against
        self.points = (wins * 3) + draws
    }
    
    func addMatch(won: Bool, draw: Bool, lost: Bool, scored: Int, against: Int) {
        if (won) {
            self.wins = self.wins + 1
        }
        if (draw) {
            self.draws = self.draws + 1
        }
        if (lost) {
            self.losses = self.losses + 1
        }
        self.scored = self.scored + scored
        self.against = self.against + against
        
        self.played = self.played + 1
        self.difference = self.scored - self.against
        self.points = (self.wins * 3) + self.draws
    }
    
}
