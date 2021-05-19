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
    @State var score: Int
    @State private var action: Int? = 0
    
    var body: some View {
        let answerIndex = Int(quiz.questions[index].answer)!
        
        if (index == ((quiz.questions).count) - 1) {
            NavigationView {
                VStack {
                    
                    NavigationLink(destination: FinishView(score: score, quiz: quiz), tag: 1, selection: $action) {
                        EmptyView()
                    }.navigationBarBackButtonHidden(true)
                    
                    if (currAnswer == quiz.questions[index].answers[answerIndex - 1]) {
                        Text("Nice Job!")
                    } else {
                        Text("Sorry, that's incorrect :(")
                        
                    }
                    
                    Button(action: {
                        if (currAnswer == quiz.questions[index].answers[answerIndex - 1]) {
                            self.score = self.score + 1
                        }
                        self.action = 1
                    }) {
                        Text("Finish")
                    }
                    
                }
            }
        } else {
            NavigationView {
                VStack {
                    NavigationLink(destination: QuizView(quiz: quiz, index: (index + 1), score: score), tag: 1, selection: $action) {
                        EmptyView()
                    }.navigationBarBackButtonHidden(true)
                    if (currAnswer == quiz.questions[index].answers[answerIndex - 1]) { // fix this to get index of curr answer and replace 1
                        Text("Nice Job!")
                    } else {
                        Text("Sorry, that's incorrect :(")
                    }
                    
                    
                    Button(action: {
                        if (currAnswer == quiz.questions[index].answers[answerIndex - 1]) {
                            self.score = self.score + 1
                        }
                        self.action = 1
                    }) {
                        Text("Next")
                    }
                }
            }
        }
    }
}
