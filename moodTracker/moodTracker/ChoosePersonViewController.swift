//
//  ChoosePersonViewController.swift
//  moodTracker
//
//  Created by Chris Mauldin on 9/30/17.
//  Copyright © 2017 Chris Mauldin. All rights reserved.
//

import Foundation
import UIKit



class ChoosePersonViewController: UITableViewController {
    
    var friends: [Friend] = []
    weak var delegate: FriendDelegate?
    var modifiedFriend: Friend?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath)
        
        cell.textLabel?.text =  friends[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedfriend = friends[indexPath.row]
        
        
        // TODO:  You will want to inform your delegate here that a pokemon was selected
        delegate?.selectedFriendAndMood(selectedfriend)
    }

    
}
