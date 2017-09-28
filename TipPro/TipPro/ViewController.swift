//
//  ViewController.swift
//  TipPro
//
//  Created by Chris Mauldin on 9/27/17.
//  Copyright © 2017 Chris Mauldin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var tipAmountField: UITextField!
    @IBOutlet weak var totalAmountField: UITextField!
    
    @IBAction func calculateTip(_ sender: Any) {
        if let billAmount = Double(billAmountField.text!) {
            var tipPercentage = 0.0
            
            switch tipSelector.selectedSegmentIndex {
            case 0:
                tipPercentage = 0.15
            case 1:
                tipPercentage = 0.18
            case 2:
                tipPercentage = 0.20
            default:
                break
            }
            
            let roundedBillAmount = round(billAmount * 100) / 100
            let tipAmount = roundedBillAmount * tipPercentage
            let roundedTipAmount = round(tipAmount * 100) / 100
            let totalAmount = roundedBillAmount * roundedTipAmount
            
            if (!billAmountField.isEditing) {
                billAmountField.text = String(format: "%.2f", roundedBillAmount)
            }
            tipAmountField.text = String(format: "%.2f", roundedTipAmount)
            totalAmountField.text = String(format: "%.2f", totalAmount)
        } else {
            billAmountField.text = ""
            tipAmountField.text = ""
            totalAmountField.text = ""
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

