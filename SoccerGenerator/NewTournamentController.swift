//
//  NewTournamentController.swift
//  SoccerGenerator
//
//  Created by Carlos Pienovi on 7/6/17.
//  Copyright © 2017 Carlos Pienovi. All rights reserved.
//

import Foundation
import UIKit

class NewTournamentController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    static let playerCellIdentifier = "PlayerCellIdentifier"
    static let minPlayers = 2
    
    var players = [NewPlayer]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var numPlayersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let playerOne = NewPlayer(name: "", team: "")
        let playerTwo = NewPlayer(name: "", team: "")
        players.append(playerOne)
        players.append(playerTwo)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCancelClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print(self.players)
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
        cell.nameLabel.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        return cell
    }
    
    func textFieldDidChange(_ textField: UITextField) {
        let position = textField.tag
        self.players[position].name = textField.text
    }
    
}
