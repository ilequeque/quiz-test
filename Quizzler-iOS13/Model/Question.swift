//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Iliyas Shakhabdin on 08.12.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var answer: [String]
    var correct: String
    
    init (q: String, a: [String], correctAnswer: String){
        text = q
        answer = a
        correct = correctAnswer
    }
}
