//
//  ViewController.swift
//  Trivia
//
//  Created by Ryan Mayerhofer on 2/21/25.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var aText: UIButton!
    @IBOutlet weak var bText: UIButton!
    @IBOutlet weak var cText: UIButton!
    @IBOutlet weak var dText: UIButton!
    
    @IBAction func aPress(_ sender: Any) {
        if let question = triviaManager.getQuestion() {
            if question.correctAnswer == .A {
                if let button = self.view.viewWithTag(101) as? UIButton {
                    button.backgroundColor = UIColor.green
                    triviaManager.score += 1
                }
            } else {
                if let button = self.view.viewWithTag(101) as? UIButton {
                    button.backgroundColor = UIColor.red
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if let button = self.view.viewWithTag(101) as? UIButton {
                    button.backgroundColor = UIColor.white
                }
                if self.triviaManager.incrementQuestionIndex() {
                    self.updateQuestionText()
                } else {
                    self.displayScore()
                }
            }
        }
    }
    @IBAction func answerB(_ sender: UIButton) {
        if let question = triviaManager.getQuestion() {
            if question.correctAnswer == .B {
                if let button = self.view.viewWithTag(102) as? UIButton {
                    button.backgroundColor = UIColor.green
                    triviaManager.score += 1
                }
            } else {
                if let button = self.view.viewWithTag(102) as? UIButton {
                    button.backgroundColor = UIColor.red
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if let button = self.view.viewWithTag(102) as? UIButton {
                    button.backgroundColor = UIColor.white
                }
                if self.triviaManager.incrementQuestionIndex() {
                    self.updateQuestionText()
                } else {
                    self.displayScore()
                }
            }
        }
    }
    @IBAction func answerC(_ sender: UIButton) {
        if let question = triviaManager.getQuestion() {
            if question.correctAnswer == .C {
                if let button = self.view.viewWithTag(103) as? UIButton {
                    button.backgroundColor = UIColor.green
                    triviaManager.score += 1
                }
            } else {
                if let button = self.view.viewWithTag(103) as? UIButton {
                    button.backgroundColor = UIColor.red
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if let button = self.view.viewWithTag(103) as? UIButton {
                    button.backgroundColor = UIColor.white
                }
                if self.triviaManager.incrementQuestionIndex() {
                    self.updateQuestionText()
                } else {
                    self.displayScore()
                }
            }
        }
    }
    @IBAction func answerD(_ sender: UIButton) {
        if let question = triviaManager.getQuestion() {
            if question.correctAnswer == .D {
                if let button = self.view.viewWithTag(104) as? UIButton {
                    button.backgroundColor = UIColor.green
                    triviaManager.score += 1
                }
            } else {
                if let button = self.view.viewWithTag(104) as? UIButton {
                    button.backgroundColor = UIColor.red
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if let button = self.view.viewWithTag(104) as? UIButton {
                    button.backgroundColor = UIColor.white
                }
                if self.triviaManager.incrementQuestionIndex() {
                    self.updateQuestionText()
                } else {
                    self.displayScore()
                }
            }
        }
    }
    
    
    var triviaManager = TriviaManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Change the label text when the view loads
        updateQuestionText()
    }
    
    func updateQuestionText() {
        questionNumber.text = "Question " + String(triviaManager.getCurrentQuestionIndex() + 1) + " of " + String(triviaManager.questions.count)
        questionText.text = String(triviaManager.getQuestion()!.text)
        aText.setTitle(triviaManager.getQuestion()!.choices[0], for: .normal)
        bText.setTitle(triviaManager.getQuestion()!.choices[1], for: .normal)
        cText.setTitle(triviaManager.getQuestion()!.choices[2], for: .normal)
        dText.setTitle(triviaManager.getQuestion()!.choices[3], for: .normal)
    }
    
    func displayScore() {
        let alert = UIAlertController(title: "Game over", message: "Score: " + String(triviaManager.score) + " of " + String(triviaManager.questions.count), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
            self.triviaManager = TriviaManager()
            self.updateQuestionText()
        }))

        present(alert, animated: true, completion: nil)
    }
}
