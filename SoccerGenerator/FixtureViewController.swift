//
//  FixtureViewController.swift
//  SoccerGenerator
//
//  Created by Carlos Pienovi on 7/11/17.
//  Copyright © 2017 Carlos Pienovi. All rights reserved.
//

import Foundation
import UIKit

class FixtureViewController: UIViewController, UITabBarControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    static let cellIdentifier = "RoundCellIdentifier"
    
    var items = [Int: [Match]]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.tabBarController?.delegate = self
        updateUI()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if (viewController == self) {
            updateUI()
        }
    }
    
    private func updateUI() {
        let tournament = StorageUtils.shared.getSelectedTournament()
        if let tournament = tournament {
            self.items = tournament.toRounds()
        } else {
            self.items.removeAll()
        }
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (self.items.isEmpty) {
            return nil
        }
        
        return "Round #\(section + 1)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.items.isEmpty) {
            return 0
        }
        
        return Array(self.items)[section].value.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FixtureViewController.cellIdentifier, for: indexPath) as! RoundTableViewCell
        let match = Array(self.items)[indexPath.section].value[indexPath.row]
        
        cell.localTeamLabel.text = match.local?.team
        cell.awayTeamLabel.text = match.away?.team
        
        var score: String
//        var backgroundColor: UIColor
        if (match.played) {
//            backgroundColor = UIColor.blue
            score = "\(match.localGoals) - \(match.awayGoals)"
        } else {
//            backgroundColor = UIColor.green
            score = "-"
        }
        
//        cell.backgroundColor = backgroundColor
        cell.scoreLabel.text = score
        
        return cell
    }
    
}
