//
//  NewTournamentController.swift
//  SoccerGenerator
//
//  Created by Carlos Pienovi on 7/6/17.
//  Copyright © 2017 Carlos Pienovi. All rights reserved.
//

import Foundation
import UIKit

class NewTournamentController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var numPlayersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        
        if (value == 0) {
            return
        }
        
        self.numPlayersLabel.text = String(value! - 1)
    }
    
    @IBAction func onPlusClick(_ sender: Any) {
        let value = Int(self.numPlayersLabel.text!)
        self.numPlayersLabel.text = String(value! + 1)
    }
    
}
