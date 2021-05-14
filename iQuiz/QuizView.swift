//
//  QuizView.swift
//  iQuiz
//
//  Created by Ashni Shah on 5/13/21.
//

import SwiftUI

struct QuizView: View {
    var quiz: [[String]]
    // var questions: [String] // all qs for this category
    var answers: [String] // all answers for this category
    var options: [String] // all options
    
    @State private var answer: String = ""
    @State var index: Int
    @State private var submit: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text(quiz[index][0])
                    .font(.title3)
                
                    Picker(selection: $answer, label: Text("Answer")) {
                        ForEach(options, id:\.self) { option in
                            Text(option)
                        }
                        
                    }
                
                NavigationLink(destination: AnswerView(answer: answers[index], currAnswer: answer)) {
//                    Button(action: {
//                        self.submit = "submit"
//                    }) {
                        Text("submit!")
                }.navigationBarBackButtonHidden(true)
                }
            }
        }
        
    //}
}
