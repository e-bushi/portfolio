//
//  ChoosePersonViewController.swift
//  moodTracker
//
//  Created by Chris Mauldin on 9/30/17.
//  Copyright © 2017 Chris Mauldin. All rights reserved.
//


import UIKit



class ChoosePersonViewController: UITableViewController, FriendDelegate {
    func selectedFriendAndMood(_ selected: Friend) {
        friends.append(selected)
    }
    
    
    var friends: [Friend] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 100
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addMood" {
            let chooseMoodViewController = segue.destination as! ChooseMoodViewController
            
            chooseMoodViewController.delegate = self
            print("Add button tapped")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendTableViewCell
        
        let row = indexPath.row
        let element = friends[row]
        
        cell.nameLabel.text = element.name
        cell.moodLabel.text = element.mood
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            friends.remove(at: indexPath.row)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    @IBAction func unwindToChoosePersonViewController(_ segue: UIStoryboardSegue) {
        
    }
}
