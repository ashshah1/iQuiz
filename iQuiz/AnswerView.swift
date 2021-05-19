//
//  AnswerView.swift
//  iQuiz
//
//  Created by Ashni Shah on 5/13/21.
//

import SwiftUI

struct AnswerView: View {
    var quiz: Quiz
    var currAnswer: String
    var index: Int
    var score: Int
    
    var body: some View {
        let answerIndex = Int(quiz.questions[index].answer)!
        
        if (index == ((quiz.questions).count) - 1) {
            NavigationView {
                VStack {
                    if (currAnswer == quiz.questions[index].answers[answerIndex - 1]) {
                        Text("Nice Job!")
                    } else {
                        Text("Sorry, that's incorrect :(")
                    }
                    
                    
                    NavigationLink(destination: FinishView()) {
                        Text("Finish")
                    }
                }
            }
        } else {
            NavigationView {
                VStack {
                    if (currAnswer == quiz.questions[index].answers[answerIndex - 1]) { // fix this to get index of curr answer and replace 1
                        Text("Nice Job!")
                    } else {
                        Text("Sorry, that's incorrect :(")
                    }
                    
                    
                    NavigationLink(destination: QuizView(quiz: quiz, index: (index + 1))) {
                        Text("Next")
                    }
                }
            }
        }
    }
}
