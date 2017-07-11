//
//  SearchTeamViewController.swift
//  SoccerGenerator
//
//  Created by Carlos Pienovi on 7/11/17.
//  Copyright © 2017 Carlos Pienovi. All rights reserved.
//

import Foundation
import UIKit

class SearchTeamViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    static let teamCellIdentifier = "TeamCellIdentifier"
    
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: TeamSelectDelegate?
    var teams = [String]()
    var filteredTeams = [String]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.teams = TeamUtils.allTeams
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        self.filteredTeams = self.teams.filter { team in
            return team.lowercased().contains(searchText.lowercased())
        }
        
        self.tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredTeams.count
        }
        
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTeamViewController.teamCellIdentifier, for: indexPath)
        let team: String
        if searchController.isActive && searchController.searchBar.text != "" {
            team = filteredTeams[indexPath.row]
        } else {
            team = teams[indexPath.row]
        }
        
        cell.textLabel?.text = team
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did select row at")
        let team: String
        if searchController.isActive && searchController.searchBar.text != "" {
            team = filteredTeams[indexPath.row]
            self.searchController.dismiss(animated: false, completion: nil)
        } else {
            team = teams[indexPath.row]
        }
        self.delegate?.teamSelected(team: team)
        self.dismiss(animated: true, completion: nil)
    }
    
}
