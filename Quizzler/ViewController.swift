//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var selectedAnswer = false
    var questionNumber = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstQuestion = allQuestions.list[questionNumber]
        questionLabel.text = firstQuestion.question
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            selectedAnswer = true
        }else if sender.tag == 2{
            selectedAnswer = false
        }
        
        self.checkAnswer()
        questionNumber += 1
        self.nextQuestion()
       
        
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        if questionNumber <= allQuestions.list.count-1{
            questionLabel.text = allQuestions.list[questionNumber].question
        }else{
            let alert = UIAlertController(title: "End Of Quiz", message: "You finished all the question, would you like to restart", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            alert.addAction(restartAction)
            self.present(alert, animated: true)
        }
        
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == selectedAnswer{
            debugPrint("You got it")
        }else{
            debugPrint("wrong")
        }
        
    }
    
    
    func startOver() {
        questionNumber = 0
       questionLabel.text = allQuestions.list[questionNumber].question
    }
    

    
}
