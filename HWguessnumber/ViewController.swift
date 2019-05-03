//
//  ViewController.swift
//  HWguessnumber
//
//  Created by Daniel on 2019/4/25.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  

    @IBOutlet weak var numberTextView: UITextView!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    var count = 6
    var answer = Int.random(in: 0...50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        feedbackLabel.text = "0到50猜一個數字，你有6次機會～"
        timeLabel.text = "6"
    }
    @IBAction func guess(_ sender: UIButton) {
        //收鍵盤
        self.view.endEditing(true)
        var numbertext = Int(numberTextView.text!)
        if numbertext != nil,numbertext == answer {
            feedbackLabel.text = "你真棒，猜對了"
           count = count - 1
           timeLabel.text! = String(count)
           
        } else if numbertext != nil,numbertext! > answer {
            feedbackLabel.text = "真可惜，在猜一次，數字在0到\(numbertext!)之間"
            numberTextView.text = nil
            count = count - 1
            timeLabel.text! = String(count)
        } else if numbertext != nil,numbertext! < answer {
            feedbackLabel.text = "真可惜，在猜一次，數字在\(numbertext!)到50之間"
            numberTextView.text = nil
            count = count - 1
            timeLabel.text! = String(count)
        }
        if count == 0 {
            feedbackLabel.text = "哇哇哇，你已經沒機會了，再重猜一次吧"
            numbertext = nil
            count = 6
            answer = Int.random(in: 0...50)
    }
}
    @IBAction func restart(_ sender: UIButton) {
        numberTextView.text = nil
        timeLabel.text! = "6"
        answer = Int.random(in: 0...50)
        feedbackLabel.text = "0到50猜一個數字，你有6次機會～"
    }
}
