//
//  EditMatchViewController.swift
//  SoccerGenerator
//
//  Created by Carlos Pienovi on 7/12/17.
//  Copyright © 2017 Carlos Pienovi. All rights reserved.
//

import Foundation
import UIKit

protocol EditMatchDelegate: class {
    func matchEditedAt(localGoals: Int, awayGoals: Int, indexPath: IndexPath)
}

class EditMatchViewController: UIViewController {
    
    var delegate: EditMatchDelegate?
    var match: Match?
    var indexPath: IndexPath?
    
    @IBOutlet weak var localTeamLabel: UILabel!
    @IBOutlet weak var localTextField: UITextField!
    @IBOutlet weak var awayTextField: UITextField!
    @IBOutlet weak var awayTeamLabel: UILabel!
    
    override func viewDidLoad() {
        self.localTeamLabel.text = match?.local?.team
        self.awayTeamLabel.text = match?.away?.team
    }
    
    @IBAction func onAcceptClick(_ sender: Any) {
        let localGoals = Int(self.localTextField.text!)
        let awayGoals = Int(self.awayTextField.text!)
        
        self.delegate?.matchEditedAt(localGoals: localGoals!, awayGoals: awayGoals!, indexPath: self.indexPath!)
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func onCancelClick(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
}
