//
//  ViewController.swift
//  MyAdventure2
//
//  Created by user250993 on 2/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var background: UIImageView!
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var optionOne: UIButton!
    
    
    @IBOutlet weak var optionTwo: UIButton!
    
    @IBOutlet weak var levelLabel: UILabel!
    
    
    var logic = Logic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerSubmitted(_ sender: UIButton) {
        let answerSubmitted = sender.titleLabel!.text!
        
        let isCorrect = logic.compareUserAnswer(answerSubmitted)
        
        if isCorrect {
            sender.backgroundColor = UIColor.green
            logic.increaseIndex()
        } else {
            sender.backgroundColor = UIColor.red
            logic.questionIndex = 0
        }
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        levelLabel.text = "Level: \(logic.getIndex())"
        questionLabel.text = logic.getNextQuestion()
        background.image = UIImage(named: String(logic.getImageName()))
        optionOne.setTitle(logic.getChoiceOne(), for: .normal)
        optionTwo.setTitle(logic.getChoiceTwo(), for: .normal)
        
        optionOne.backgroundColor = UIColor.clear
        optionTwo.backgroundColor = UIColor.clear
    }
    
}

