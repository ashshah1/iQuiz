//
//  FinishView.swift
//  iQuiz
//
//  Created by Ashni Shah on 5/13/21.
//

import SwiftUI

struct FinishView: View {
    @State var score: Int
    var quiz: Quiz

    
    var body: some View {
        let totalQ = (quiz.questions).count
        if (score == 0) {
            VStack {
                Text("Wrap-up")
                Text("Here's your final score: " + String(score) + "out of " + String(totalQ))
                Text("Better luck next time!")
            }
        } else {
            Text("Wrap-up")
            Text("Here's your final score: " + String(score))
            Text("Good work!")
        }
    }
}
