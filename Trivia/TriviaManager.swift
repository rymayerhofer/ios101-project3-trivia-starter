//
//  TriviaManager.swift
//  Trivia
//
//  Created by Ryan Mayerhofer on 2/21/25.
//
struct Question {
    enum AnswerIndex {
        case A, B, C, D
    }
        
    let text: String
    let choices: [String]
    let correctAnswer: AnswerIndex
}

class TriviaManager {
    var questions: [Question] = [Question(text: "Which of the following bands is considered one of the pioneers of progressive metal?",
                                          choices: ["Dream Theater", "Pantera", "Slipknot", "Metallica"],
                                          correctAnswer: .A),
                                 Question(text: "What is the name of the 40-minute song by Between the Buried and Me that serves as a continuous concept piece?",
                                          choices: ["Automata", "Telos", "Colors II", "Swim to the Moon"],
                                          correctAnswer: .D),
                                 Question(text: "Which progressive metal band is known for their use of Fibonacci sequences in their song structures, most notably in the song 'Lateralus'?",
                                          choices: ["Opeth", "Tool", "Symphony X", "Mastodon"],
                                          correctAnswer: .B)]
    
    var currentQuestionIndex = 0
    
    var score: Int = 0
    
    func getCurrentQuestionIndex() -> Int {
        return currentQuestionIndex
    }
    
    func getQuestion() -> Question? {
        return currentQuestionIndex < questions.count ? questions[currentQuestionIndex] : nil
    }
    
    func incrementQuestionIndex() -> Bool {
        if currentQuestionIndex == questions.count - 1 {
            return false
        } else {
            currentQuestionIndex += 1
            return true
        }
    }
}
