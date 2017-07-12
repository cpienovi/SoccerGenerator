//
//  PositionsViewController.swift
//  SoccerGenerator
//
//  Created by Carlos Pienovi on 7/11/17.
//  Copyright © 2017 Carlos Pienovi. All rights reserved.
//

import Foundation
import UIKit

class PositionsViewController: UIViewController, UITabBarControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    static let cellIdentifier = "PositionCellIdentifier"
    
    @IBOutlet weak var tableView: UITableView!
    
    var items = [Position]()
    
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
        
        return cell
    }
    
}
