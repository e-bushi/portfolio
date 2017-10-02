//
//  MoodDisplayViewController.swift
//  moodTracker
//
//  Created by Chris Mauldin on 9/30/17.
//  Copyright © 2017 Chris Mauldin. All rights reserved.
//

import Foundation
import UIKit

class MoodDisplayViewController: UIViewController, FriendDelegate {
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendMood: UILabel!
    
    static var friends = [
        Friend(name: "Kaichi", mood: "😎"),
        Friend(name: "Sunny", mood: "😌"),
        Friend(name: "Andrew", mood: "🤒"),
        Friend(name: "James", mood: "😉"),
        Friend(name: "Kash", mood: "😏")
    ]
    
    var selectedFriend: Friend?
    var friendToDisplay: Friend = randomFriend()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendName.text! = friendToDisplay.name
        friendMood.text! = friendToDisplay.mood
    }
    
    
    static func randomFriend()-> Friend {
        let index = Int(arc4random()) % friends.count
        return friends[index]
    }
    
    func goToChoosePersonViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let choosePersonController = storyboard.instantiateViewController(withIdentifier: "ChoosePersonViewController") as! ChoosePersonViewController
        
        choosePersonController.friends = MoodDisplayViewController.friends
        
        choosePersonController.delegate = self
        
        self.navigationController?.pushViewController(choosePersonController, animated: true)
    }
    
    func selectedFriendAndMood(_ selected: Friend) {
        selectedFriend = selected
        chooseAndDisplayFriend()
    }
    
    func chooseAndDisplayFriend() {
        guard let selectedFriend = selectedFriend else {return}
        if selectedFriend.name == friendName.text {
            return
        } else {
            friendName.text = selectedFriend.name
            friendMood.text = selectedFriend.mood
        }
    }
    
    @IBAction func chooseFriend(_ sender: Any) {
        goToChoosePersonViewController()
    }
    
    
}

