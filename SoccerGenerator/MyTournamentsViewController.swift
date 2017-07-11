//
//  MyTournamentsViewController.swift
//  SoccerGenerator
//
//  Created by Carlos Pienovi on 7/11/17.
//  Copyright © 2017 Carlos Pienovi. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import ObjectMapper

class MyTournamentsViewController: UITableViewController {
    
    static let cellIdentifier = "TournamentCellIdentifier"
    
    var database: DatabaseReference!
    var refHandle: UInt?
    var tournaments = [Tournament]()
    
    override func viewDidLoad() {
        self.database = Database.database().reference()
        
        refHandle = self.database.child("tournaments").observe(DataEventType.value, with: { (snapshot) in
            if (!snapshot.exists()) {
                return
            }
            
            self.tournaments.removeAll()
            let tours = snapshot.value as? [String : AnyObject] ?? [:]
            for t in tours {
                let tournament = Mapper<Tournament>().map(JSONObject: t.value)
                self.tournaments.append(tournament!)
            }
            self.tableView.reloadData()
        })
    }
    
    deinit {
        if let refHandle = self.refHandle {
            self.database.removeObserver(withHandle: refHandle)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tournaments.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTournamentsViewController.cellIdentifier, for: indexPath)
        let tournament = self.tournaments[indexPath.row]
        
        cell.textLabel?.text = tournament.name
        
        return cell
    }
    
}
