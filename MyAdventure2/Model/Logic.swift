//
//  Logic.swift
//  MyAdventure2
//
//  Created by user250993 on 2/11/24.
//

import Foundation

struct Logic {
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
    
    mutating func compareUserAnswer(_ response: String) -> Bool {
        if response == question[questionIndex].answer {
            return true
        } else {
            return false
        }
    }
    
    mutating func increaseIndex() {
        if questionIndex < question.count - 1 {
            questionIndex += 1
        } else {
            questionIndex = 0
        }
    }
    
    func getNextQuestion() -> String {
        return question[questionIndex].question
    }
    
    func getChoiceOne() -> String {
        return question[questionIndex].option_one
    }
    
    func getChoiceTwo() -> String {
        return question[questionIndex].option_two
    }
    
    func getImageName() -> Int {
        return questionIndex + 1
    }
}










