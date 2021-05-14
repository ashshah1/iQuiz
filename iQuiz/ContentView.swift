//
//  ContentView.swift
//  iQuiz
//
//  Created by Ashni Shah on 5/6/21.
//

import SwiftUI

struct ContentView: View {
    @State var showAlert = false;
    @State var showQuiz = false;
    let categories =
        ["Marvel Superheroes": "superheroes for 500 please, alex",
         "Science": "beakers and what not",
         "Mathematics": "2 plus 2 is 5 right"]
    
    let questions = [["What is the mitochondria?", "Another science question", "Another science question"], ["math amirite", "more math amirite", "and some more"], ["iron man", "scarlet witch", "thor"]]
    // array - categories
    // array - all questions
    // array - strings of options for one questions
    
    let options = [
        [["science 1", "science 1", "science 1", "science 1"], ["science 2", "science 2", "science 2", "science 2"], ["science 3", "science 3", "science 3", "science 3"]],
        [["math 1", "math 1", "math 1", "math 1"], ["math 2", "math 2", "math 2", "math 2"], ["math 3", "math 3", "math 3", "math 3"]],
        [["marvel 1", "marvel 1", "marvel 1", "marvel 1"], ["marvel 2", "mmarvel 2", "marvel 2", "marvel 2"], ["marvel 3", "marvel 3", "marvel 3", "marvel 3"]]
        ]
    
    let answers = [
        ["science 2", "science 1", "science 1"],
        ["math 1", "math 2", "math 3"],
        ["marvel 1", "marvel 1", "marvel 2"]
    
        ]
    
    let images = ["shield.fill", "heart.circle", "function"]
    var body: some View {
       
        NavigationView {
            VStack{
            List {
                ForEach(categories.sorted(by: >), id: \.key) { key, value in
                    HStack {
                        Image(systemName: "questionmark.diamond.fill")
                    VStack(alignment: .leading) {
                        NavigationLink(destination: QuizView(quiz: questions, answers: answers[0], options: options[0][0], index: 0)) {
                        Text(key)
                            .font(.title3)
                            .foregroundColor(.blue)
                        }
                        Text(value)
                            .font(.body)
                    }
                    .padding()
                    }
                }
            }
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.showAlert = true
                    }, label: {
                        Image(systemName: "gear")
                        Text("Settings")
                    }).alert(isPresented: $showAlert) { () -> Alert in
                        Alert(title: Text("Settings"), message: Text("Your settings go here"), dismissButton: .default(Text("Ok")))
                    }
                }
            }
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
