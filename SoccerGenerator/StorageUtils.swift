//
//  StorageUtils.swift
//  SoccerGenerator
//
//  Created by Carlos Pienovi on 7/11/17.
//  Copyright © 2017 Carlos Pienovi. All rights reserved.
//

import Foundation

public class StorageUtils {
    
    private static let kSelectedTournamentPosition = "TOURNAMENT_POSITION"
    
    static let shared = StorageUtils()
    
    var selectedTournament: Tournament?
    
    public func saveTournamentSelectedPosition(position : Int) {
        UserDefaults.standard.set(position, forKey: StorageUtils.kSelectedTournamentPosition)
    }
    
    public func getTournamentSelectedPosition() -> Int {
        return UserDefaults.standard.integer(forKey: StorageUtils.kSelectedTournamentPosition)
    }
    
    public func clearSelection() {
        self.selectedTournament = nil
    }
    
    public func setSelectedTournament(tournament: Tournament) {
        self.selectedTournament = tournament
    }
    
    public func getSelectedTournament() -> Tournament? {
        return self.selectedTournament
    }

}
