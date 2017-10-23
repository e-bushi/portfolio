//
//  ChooseEnglishTableViewController.swift
//  japaneseGuessingGame
//
//  Created by Chris Mauldin on 10/22/17.
//  Copyright © 2017 Chris Mauldin. All rights reserved.
//

import UIKit

class ChooseEnglishTableViewController: UITableViewController {
    
    var japVerbs: [wordGif] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var selectedJapaneseWord: wordGif?
    var japaneseMeaningCallback: ((wordGif) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return japVerbs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "engMeaning", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = japVerbs[indexPath.row].englishWord
        return cell
    }
 

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedWord = japVerbs[indexPath.row]
        
        japaneseMeaningCallback?(selectedWord)
        
        self.navigationController?.popViewController(animated: true)
    }
}
