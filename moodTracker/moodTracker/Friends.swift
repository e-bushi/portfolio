//
//  Friends.swift
//  moodTracker
//
//  Created by Chris Mauldin on 9/30/17.
//  Copyright © 2017 Chris Mauldin. All rights reserved.
//

import Foundation
import UIKit

protocol FriendDelegate: class {
    func selectedFriendAndMood(_ selected: Friend)
}

struct Friend {
    var name: String = ""
    var mood: String = ""
    var modTime = Date()
}

extension Friend: Equatable {
    static func ==(lhs: Friend, rhs: Friend) -> Bool {
        return lhs.mood == rhs.mood
    }
}
