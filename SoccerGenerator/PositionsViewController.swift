//
//  PositionsViewController.swift
//  SoccerGenerator
//
//  Created by Carlos Pienovi on 7/11/17.
//  Copyright © 2017 Carlos Pienovi. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import ObjectMapper

class PositionsViewController: UIViewController, UITabBarControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    static let cellIdentifier = "PositionCellIdentifier"
    
    @IBOutlet weak var tableView: UITableView!
    
    var items = [Position]()
    var refHandle: UInt?
    var database: DatabaseReference!
    
    override func viewDidLoad() {
        self.tabBarController?.delegate = self
        self.database = Database.database().reference()
        
        updateUI()
        
        self.refHandle = self.database.child("tournaments").observe(DataEventType.value, with: { (snapshot) in
            let tours = snapshot.value as? [String : AnyObject] ?? [:]
            for t in tours {
                let tournament = Mapper<Tournament>().map(JSONObject: t.value)
                tournament?.id = t.key
                let selected = StorageUtils.shared.getSelectedTournament()
                if (selected?.name == tournament?.name) {
                    self.items.removeAll()
                    self.items = (tournament?.toPositions())!
                    self.tableView.reloadData()
                }
            }
        })
    }
    
    deinit {
        if let refHandle = self.refHandle {
            self.database.removeObserver(withHandle: refHandle)
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("tab selected positions view controller")
        if (viewController == self) {
            updateUI()
        }
    }
    
    private func updateUI() {
        let tournament = StorageUtils.shared.getSelectedTournament()
        if let tournament = tournament {
            self.items = tournament.toPositions()
        } else {
            self.items.removeAll()
        }
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PositionsViewController.cellIdentifier, for: indexPath) as! PositionTableViewCell
        let position = self.items[indexPath.row]
        
        if(indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor(red: 224/255.0, green: 224/255.0, blue: 224/255.0, alpha: 0.5)
        } else {
            cell.backgroundColor = UIColor.white
        }
        
        cell.teamLabel.text = position.team
        cell.playedLabel.text = String(position.played)
        cell.winsLabel.text = String(position.wins)
        cell.drawsLabel.text = String(position.draws)
        cell.lossesLabel.text = String(position.losses)
        cell.scoredLabel.text = String(position.scored)
        cell.againstLabel.text = String(position.against)
        cell.differenceLabel.text = String(position.difference)
        cell.pointsLabel.text = String(position.points)
        
        return cell
    }
    
}
