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

class Tournament: Mappable {
    
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
    
    func saveToFireBase(database: DatabaseReference) {
        let dictionary = Mapper<Tournament>().toJSON(self)
        database.child("tournaments").childByAutoId().setValue(dictionary)
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
