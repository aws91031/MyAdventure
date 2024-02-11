//
//  Question.swift
//  MyAdventure2
//
//  Created by user250993 on 2/11/24.
//

import Foundation

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
