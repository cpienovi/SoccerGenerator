//
//  FixtureViewController.swift
//  SoccerGenerator
//
//  Created by Carlos Pienovi on 7/11/17.
//  Copyright © 2017 Carlos Pienovi. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class FixtureViewController: UIViewController, UITabBarControllerDelegate, UITableViewDelegate, UITableViewDataSource, EditMatchDelegate {
    
    static let cellIdentifier = "RoundCellIdentifier"
    
    var items = [Int: [Match]]()
    var database: DatabaseReference!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.tabBarController?.delegate = self
        self.database = Database.database().reference()
        updateUI()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("tab selected fixture view controller")
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let match = self.items[indexPath.section]?[indexPath.row]
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "editMatchViewController") as? EditMatchViewController
        {
            viewController.delegate = self
            viewController.indexPath = indexPath
            viewController.match = match
            viewController.modalPresentationStyle = .overCurrentContext
            present(viewController, animated: false, completion: nil)
        }
    }
    
    func matchEditedAt(localGoals: Int, awayGoals: Int, indexPath: IndexPath) {
        let match = self.items[indexPath.section]?[indexPath.row]
        match?.localGoals = localGoals
        match?.awayGoals = awayGoals
        match?.played = true
        self.tableView.reloadData()
        
        let tournament = StorageUtils.shared.getSelectedTournament()
        tournament?.schedule[indexPath.section][indexPath.row] = match!
        tournament?.saveToFireBase(database: self.database)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FixtureViewController.cellIdentifier, for: indexPath) as! RoundTableViewCell
        let match = self.items[indexPath.section]?[indexPath.row]
        
        cell.localTeamLabel.text = match?.local?.team
        cell.awayTeamLabel.text = match?.away?.team
        
        var score: String
        var backgroundColor: UIColor
        if (match?.played)! {
            backgroundColor = UIColor(red: 155/255.0, green: 193/255.0, blue: 255/255.0, alpha: 0.7)
            score = "\((match?.localGoals)!) - \((match?.awayGoals)!)"
        } else {
            backgroundColor = UIColor(red: 155/255.0, green: 193/255.0, blue: 255/255.0, alpha: 0.2)
            score = "-"
        }
        
        cell.backgroundColor = backgroundColor
        cell.scoreLabel.text = score
        cell.selectionStyle = .none;
        
        return cell
    }
    
}
