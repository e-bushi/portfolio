//
//  ChooseMoodViewController.swift
//  moodTracker
//
//  Created by Chris Mauldin on 10/2/17.
//  Copyright © 2017 Chris Mauldin. All rights reserved.
//

import Foundation
import UIKit

class ChooseMoodViewController: UIViewController {
    
    @IBOutlet weak var friendNameTextField: UITextField!
    @IBOutlet weak var friendMoodSegue: UISegmentedControl!
    
    weak var delegate: FriendDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save" {
            
            var friend = Friend()
            
            friend.name = friendNameTextField.text ?? ""
            
            var mood = ""
            
            switch friendMoodSegue.selectedSegmentIndex {
            case 0:
                mood = "😊"
                
            case 1:
                mood = "😐"
                
            case 2:
                mood = "😠"
                
            default:
                break
            }
            
            friend.mood = mood
            friend.modTime = Date()
            
            if friend.name != "" {
                delegate?.selectedFriendAndMood(friend)
            }
            
            print("Save this")
        } else {
            
            print("cancel")
        }
    }
    
    
    
    
    
    
}
