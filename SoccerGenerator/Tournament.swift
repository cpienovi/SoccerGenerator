//
//  Tournament.swift
//  SoccerGenerator
//
//  Created by Carlos Pienovi on 7/11/17.
//  Copyright © 2017 Carlos Pienovi. All rights reserved.
//

import Foundation
import FirebaseDatabase
import ObjectMapper

public class Tournament: Mappable {
    
    var name: String = ""
    var schedule: [[Match]] = [[Match]]()
    
    init(name: String, schedule: [[Match]]) {
        self.name = name
        self.schedule = schedule
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        name        <- map["name"]
        schedule    <- map["schedule"]
    }
    
    func addRound(matches: [Match]) {
        self.schedule.append(matches)
    }
    
    func toRounds() -> [Int: [Match]] {
        var result: [Int: [Match]] = [Int: [Match]]()
        for round in 0...(self.schedule.count - 1) {
            result[round] = self.schedule[round]
        }
        return result
    }
    
    func toPositions() -> [Position] {
        var result: [Position] = [Position]()
        
        if (!self.schedule.isEmpty) {
            for round in 0...(self.schedule.count - 1) {
                var matches = self.schedule[round]
                    for i in 0...(matches.count - 1) {
                        let match = matches[i]
                        if (match.played) {
                            result = sumGoals(match: match, positions: result)
                        }
                    }
            }
        }
        
        return result
    }
    
    private func sumGoals(match: Match, positions: [Position]) -> [Position] {
        var localInList: Bool = false
        var awayInList: Bool = false
        var result = positions
        
        for pos in result {
            if (pos.team == match.local?.team) {
                localInList = true
                let won = match.localGoals > match.awayGoals
                let draw = match.localGoals == match.awayGoals
                pos.addMatch(won: won, draw: draw, lost: !won, scored: match.localGoals, against: match.awayGoals)
            }
            if (pos.team == match.away?.team) {
                awayInList = true
                let won = match.awayGoals > match.localGoals
                let draw = match.awayGoals == match.localGoals
                pos.addMatch(won: won, draw: draw, lost: !won, scored: match.awayGoals, against: match.localGoals)
            }
        }
        
        if (!localInList) {
            let newPosition = Position(team: (match.local?.team)!, wins: 0, draws: 0, losses: 0, scored: 0, against: 0)
            let won = match.localGoals > match.awayGoals
            let draw = match.localGoals == match.awayGoals
            newPosition.addMatch(won: won, draw: draw, lost: !won, scored: match.localGoals, against: match.awayGoals)
            result.append(newPosition)
        }
        
        if (!awayInList) {
            let newPosition = Position(team: (match.away?.team)!, wins: 0, draws: 0, losses: 0, scored: 0, against: 0)
            let won = match.awayGoals > match.localGoals
            let draw = match.awayGoals == match.localGoals
            newPosition.addMatch(won: won, draw: draw, lost: !won, scored: match.awayGoals, against: match.localGoals)
            result.append(newPosition)
        }
        
        return result
    }
    
    func saveToFireBase(database: DatabaseReference) {
        let dictionary = Mapper<Tournament>().toJSON(self)
        let child = database.child("tournaments").childByAutoId()
        child.updateChildValues(dictionary)
    }
    
    func imprimir() {
        for round in 0...schedule.count - 1 {
            let matches = schedule[round]
            print("Round #\(round)")
            for i in 0...matches.count - 1 {
                let match = matches[i]
                let local = match.local?.name
                let away = match.away?.name
                print("Match: \(local!) vs \(away!)")
            }
        }
    }
    
}
