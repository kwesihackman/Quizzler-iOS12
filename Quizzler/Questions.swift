//
//  Questions.swift
//  Quizzler
//
//  Created by Eric Hackman on 08/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    let question: String
    let answer:  Bool
    
    init(text: String, correctAnswer:Bool) {
        question = text
        answer = correctAnswer
    }
}
