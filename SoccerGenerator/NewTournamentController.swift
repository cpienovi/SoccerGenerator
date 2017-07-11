//
//  NewTournamentController.swift
//  SoccerGenerator
//
//  Created by Carlos Pienovi on 7/6/17.
//  Copyright © 2017 Carlos Pienovi. All rights reserved.
//

import Foundation
import UIKit

protocol TeamSelectDelegate: class {
    func teamSelected(team: String)
}

class NewTournamentController: UIViewController, UITableViewDelegate, UITableViewDataSource, TeamSelectDelegate {
    
    static let playerCellIdentifier = "PlayerCellIdentifier"
    static let minPlayers = 2
    
    var players = [NewPlayer]()
    var teamPosition: Int?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var numPlayersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let playerOne = NewPlayer(name: "", team: "")
        let playerTwo = NewPlayer(name: "", team: "")
        players.append(playerOne)
        players.append(playerTwo)
        
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCancelClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onMinusClick(_ sender: Any) {
        let value = Int(self.numPlayersLabel.text!)
        
        if (value == NewTournamentController.minPlayers) {
            return
        }
        
        self.numPlayersLabel.text = String(value! - 1)
        players.remove(at: self.players.count - 1)
        self.tableView.reloadData()
    }
    
    @IBAction func onPlusClick(_ sender: Any) {
        let value = Int(self.numPlayersLabel.text!)
        self.numPlayersLabel.text = String(value! + 1)
        
        let player = NewPlayer(name: "", team: "")
        players.append(player)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let player = self.players[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: NewTournamentController.playerCellIdentifier, for: indexPath) as! NewPlayerTableViewCell
        
        cell.nameLabel.text = player.name
        cell.nameLabel.tag = indexPath.row
        cell.nameLabel.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        
        cell.teamTextField.text = player.team
        cell.teamTextField.tag = indexPath.row
        cell.teamTextField.addTarget(self, action: #selector(self.teamTouch(_:)), for: .editingDidBegin)

        return cell
    }
    
    func textFieldDidChange(_ textField: UITextField) {
        let position = textField.tag
        self.players[position].name = textField.text
    }
    
    func teamTouch(_ textField: UITextField) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "searchTeamViewController") as? SearchTeamViewController
        {
            teamPosition = textField.tag
            viewController.delegate = self
            present(viewController, animated: true, completion: nil)
        }
    }
    
    func teamSelected(team: String) {
        if let position = teamPosition {
            self.players[position].team = team
            self.tableView.reloadData()
        }
    }

}
