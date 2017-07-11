//
//  Tournament.swift
//  SoccerGenerator
//
//  Created by Carlos Pienovi on 7/11/17.
//  Copyright © 2017 Carlos Pienovi. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Tournament {
    
    var name: String
    var schedule: [[Match]]
    
    init(name: String, schedule: [[Match]]) {
        self.name = name
        self.schedule = schedule
    }
    
    func addRound(matches: [Match]) {
        self.schedule.append(matches)
    }
    
    func saveToFireBase(database: DatabaseReference) {
        
    }
    
    func imprimir() {
        for round in 0...schedule.count - 1 {
            let matches = schedule[round]
            print("Round #\(round)")
            for i in 0...matches.count - 1 {
                let match = matches[i]
                let local = match.local.name
                let away = match.away.name
                print("Match: \(local!) vs \(away!)")
            }
        }
    }
    
}
