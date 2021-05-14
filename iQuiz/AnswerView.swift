//
//  AnswerView.swift
//  iQuiz
//
//  Created by Ashni Shah on 5/13/21.
//

import SwiftUI

struct AnswerView: View {
    var answer: String
    var currAnswer: String
    
    var body: some View {
        VStack {
            Text(answer)
            Text(currAnswer)
        }
    }
}
