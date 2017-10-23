//
//  japaneseWordAndImage.swift
//  japaneseGuessingGame
//
//  Created by Chris Mauldin on 10/22/17.
//  Copyright © 2017 Chris Mauldin. All rights reserved.
//

import UIKit

struct wordGif {
    var japaneseWord: String
    var gif: UIImage
    var englishWord: String
}

extension wordGif: Equatable {
    static func ==(lhs: wordGif, rhs: wordGif) -> Bool {
        return lhs.englishWord == rhs.englishWord
    }
}
