//
//  ViewController.swift
//  DZL7 - Foundation, UIFont, UITextView
//
//  Created by Macbook on 15.02.2019.
//  Copyright © 2019 Nikolay_Romanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var historyArray = [String].init()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var labelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let sumStringArray = UserDefaults.standard.stringArray(forKey: "historySum") ?? [""]
        print(sumStringArray)
        for i in sumStringArray {
            textView.text += i + "\n"
            historyArray.append(i)
        }
    }
    
    func textToInt(text: String?) -> Int {
        let text: String = text ?? ""
        if let textToInt = Int(text) {
            return textToInt
        }
        else {
            print("Enter the number pls")
            return 0
        }
    }

    @IBAction func buttonSumNumber(_ sender: Any) {
        let numberTextView = textToInt(text: textView.text)
        let numberTextField = textToInt(text: textField.text)
        let sum = numberTextField + numberTextView
        textView.font = .systemFont(ofSize: CGFloat(sum))
        labelResult.text = String(sum)
        let sumString = String(numberTextView) + " + " + String(numberTextField) + " = " + String(sum)
        historyArray.append(sumString)
        UserDefaults.standard.set(historyArray, forKey: "historySum")
    }
}

