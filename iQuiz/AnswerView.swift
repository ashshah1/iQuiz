//
//  AnswerView.swift
//  iQuiz
//
//  Created by Ashni Shah on 5/13/21.
//

import SwiftUI

struct AnswerView: View {
    var quiz: [String]
    var currAnswer: String
    var index: Int
    var answers: [String] // all answers for this category
    var options: [[String]] // all options
    
    var body: some View {
        NavigationView {
            VStack {
                if (answers[index] == currAnswer) {
                    Text("nice job!")
                } else {
                    Text("sorry that's incorrect")
                }
                
                
                NavigationLink(destination: QuizView(quiz: quiz, answers: answers, options: options, index: (index + 1))) {
                    Text("next q")
                }.navigationBarBackButtonHidden(true)
            }
        }
    }
}
