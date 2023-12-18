//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterUser: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var choiceButton: UIButton!
    
    
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterUser.text = "Score: 0"
        updateUI()
        progressBar.progress = 0.0
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!    //True or False
        
        if quizBrain.checkAnswer(userAnswer){
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        choiceButton.setTitle(quizBrain.getAnswers()[0], for: .normal)
        trueButton.setTitle(quizBrain.getAnswers()[1], for: .normal)
        falseButton.setTitle(quizBrain.getAnswers()[2], for: .normal)
        progressBar.progress = quizBrain.getProgress()
        counterUser.text = "Score: \(quizBrain.getScore())/\(quizBrain.getMaxPoints())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        choiceButton.backgroundColor = UIColor.clear
    }
}

