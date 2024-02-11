//
//  ViewController.swift
//  MyAdventure2
//
//  Created by user250993 on 2/9/24.
//

import UIKit

struct Question {
    
    init(_ ques: String, _ o_one:String, _ o_two: String, _ ans: String) {
        question = ques
        option_one = o_one
        option_two = o_two
        answer = ans
    }
    
    var question: String
    var answer: String
    var option_one: String
    var option_two: String
    
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var background: UIImageView!
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var optionOne: UIButton!
    
    
    @IBOutlet weak var optionTwo: UIButton!
    
    var questionIndex : Int = 0
    
    let question = [
                Question("A scary monster is chasing you! Which way do you turn?",
                         "Left",
                         "Right",
                         "Left"),
                Question("You seem to have lost him! What do you do?",
                         "Keep running",
                         "Slow down to catch your breath",
                         "Slow down to catch your breath"),
                Question("You can finally breath again, but the monster has reappeared! What's your next move?",
                         "Start running again",
                         "Beg for mercy",
                         "Beg for mercy"),
                Question("You come face to face with him. He wants to know why you were running.",
                         "You were always told all monsters are bad",
                         "You were scared",
                         "You were always told all monsters are bad"),
                Question("The Monster explains that you should always question what you hear.",
                         "You come to an understanding and become friends",
                         "You try to get away as soon as you can",
                         "You come to an understanding and become friends")
            ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    /*@IBAction func answerSubmitted(_ sender: UIButton) {
        let answerSubmitted = sender.titleLabel!.text!
        
        let isCorrect = compareUserAnswer(answerSubmitted)
        
        if isCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        increaseIndex()
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }*/
    
    @IBAction func answerSubmitted(_ sender: UIButton) {
        let answerSubmitted = sender.titleLabel!.text!
        
        let isCorrect = compareUserAnswer(answerSubmitted)
        
        if isCorrect {
            sender.backgroundColor = UIColor.green
            increaseIndex()
        } else {
            sender.backgroundColor = UIColor.red
            questionIndex = 0
        }
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = question[questionIndex].question
        background.image = UIImage(named: String(questionIndex + 1))
        optionOne.setTitle(question[questionIndex].option_one, for: .normal)
        optionTwo.setTitle(question[questionIndex].option_two, for: .normal)
        optionOne.backgroundColor = UIColor.clear
        optionTwo.backgroundColor = UIColor.clear
    }
    
    func compareUserAnswer(_ response: String) -> Bool {
        if response == question[questionIndex].answer {
            return true
        } else {
            return false
        }
    }
    
    func increaseIndex() {
        if questionIndex < question.count - 1 {
            questionIndex += 1
        } else {
            questionIndex = 0
        }
    }
    
    func returnToZero() {
        questionIndex = 0
    }
}

