//
//  QuizView.swift
//  iQuiz
//
//  Created by Ashni Shah on 5/13/21.
//

import SwiftUI

struct QuizView: View {
    var quiz: Quiz
    // var questions: [String] // all qs for this category
    // var answers: [String] // all answers for this category
    // var options: [[String]] // all options
    
    @State private var answer: String = ""
    @State var index: Int
    @State private var submit: String = ""
    @State var score = 0
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text(quiz.questions[index].text)
                    .font(.title3)

                    Picker(selection: $answer, label: Text("Answer")) {
                        ForEach(quiz.questions[index].answers, id:\.self) { option in
                            Text(option)
                        }

                    }

                NavigationLink(destination: AnswerView(quiz: quiz, currAnswer: answer, index: index, score: score)) {
//                    Button(action: {
//                        self.submit = "submit"
//                    }) {
                        Text("Submit!")
                }.navigationBarBackButtonHidden(true)
                }
            }
        
    }
    //}
}
