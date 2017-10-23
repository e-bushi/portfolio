//
//  DisplayJapaneseWord.swift
//  japaneseGuessingGame
//
//  Created by Chris Mauldin on 10/22/17.
//  Copyright © 2017 Chris Mauldin. All rights reserved.
//

import UIKit

class DisplayJapaneseWord: UIViewController {
    @IBOutlet weak var questionAnswerLabel: UILabel!
    @IBOutlet weak var gifMeaning: UIImageView!
    @IBOutlet weak var japaneseWord: UILabel!
    @IBOutlet weak var guessWordbutton: UIButton!
    @IBOutlet weak var generateNewWordButton: UIButton!
    
    static let japWords = [
        wordGif(japaneseWord: "食べる", gif: UIImage.gif(name: "taberu")! , englishWord: "to eat"),
        wordGif(japaneseWord: "落ちる", gif: UIImage.gif(name: "ochiru")!, englishWord: "to run"),
        wordGif(japaneseWord: "笑う", gif: UIImage.gif(name: "warau")!, englishWord: "to laugh"),
        wordGif(japaneseWord: "かく", gif: UIImage.gif(name: "kaku")!, englishWord: "to hear")
    ]
    
    var chosenWord: wordGif?
    var displayedWord: wordGif = chooseRandomWord()
    
    
    
    static func chooseRandomWord() -> wordGif {
        let index = Int(arc4random()) % japWords.count
        return japWords[index]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        questionAnswerLabel.text = "Do you know what the japanese word below means?"
        japaneseWord.text = displayedWord.japaneseWord
        gifMeaning.image = nil
    }
    
    
    
    func goToChooseEnglishTableViewController(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let chooseEnglishTableView = storyboard.instantiateViewController(withIdentifier: "englishMeaningVC") as! ChooseEnglishTableViewController
        
        chooseEnglishTableView.japVerbs = DisplayJapaneseWord.japWords
        chooseEnglishTableView.japaneseMeaningCallback = self.checkGuessedMeaningAndShowResults
        
        self.navigationController?.pushViewController(chooseEnglishTableView, animated: true)
    }
    
    func checkGuessedMeaningAndShowResults(selectedWord: wordGif) {
        chosenWord = selectedWord
        
        if chosenWord?.englishWord == displayedWord.englishWord {
            questionAnswerLabel.text = "That's correct, it's \(displayedWord.englishWord)"
            gifMeaning.image = displayedWord.gif
        } else {
            questionAnswerLabel.text = "ehhh sorry, it's \(displayedWord.englishWord)"
            gifMeaning.image = displayedWord.gif
        }
    }
    
    @IBAction func chooseEnglishMeaning(_ sender: UIButton) {
        goToChooseEnglishTableViewController()
    }
    
    @IBAction func generateRandomWord(_ sender: UIButton) {
        let randomWord = DisplayJapaneseWord.chooseRandomWord()
        
        
        questionAnswerLabel.text = "What about this Japanese word?"
        japaneseWord.text = randomWord.japaneseWord
        displayedWord.japaneseWord = randomWord.japaneseWord
        displayedWord.englishWord = randomWord.englishWord
        displayedWord.gif = randomWord.gif
        gifMeaning.image = nil
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
