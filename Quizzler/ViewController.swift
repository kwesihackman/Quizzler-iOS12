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
    var userScore = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
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
        scoreLabel.text = " Score : \(userScore)"
        progressLabel.text = "\(questionNumber+1) / \(allQuestions.list.count)"
    }
    

    func nextQuestion() {
        if questionNumber <= allQuestions.list.count-1{
            questionLabel.text = allQuestions.list[questionNumber].question
            updateUI()
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
           userScore += 10
        }else{
            debugPrint("wrong")
        }
        
    }
    
    
    func startOver() {
        questionNumber = 0
        userScore = 0
       nextQuestion()
    }
    

    
}
