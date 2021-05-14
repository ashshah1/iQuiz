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
    
    let categories = ["Science", "Mathematics", "Marvel Superheroes"]
    let descrips = ["beakers and what not", "2 plus 2 is 5 right", "superheroes for 500 please, alex"]
    
//    let categories =
//        ["Marvel Superheroes": "superheroes for 500 please, alex",
//         "Science": "beakers and what not",
//         "Mathematics": "2 plus 2 is 5 right"]
    
    let questions = [
        ["What is the mitochondria?", "What is the first element of the periodic table?", "What is physics?"],
        ["When do you use the quadratic formula?", "What is the smallest number?", "How many numbers are there?"],
        ["Which of the following is not an Avenger?", "Who is Captain America?", "Thor is __"]]

    
    let options = [
        [
            ["the powerhouse of the cell", "heck if i know", "a dog breed", "a democratic senate candidate"],
            ["hydrogen", "kerfuffle", "helium", "lithium"],
            ["a made up subject", "study of maps", "study of oranges", "a type of coconut"]],
        [
            ["in multivariate calculus", "never", "on the SATs", "in geometry"],
            ["0", "1", "3", "impossible to say"],
            ["exactly 4", "1", "at least 12", "398"]],
        [
            ["iron man", "captain bulgaria", "captain marvel", "ant man"],
            ["barack obama", "steve rogers", "bucky barnes", "megan calverley"],
            ["a good movie", "a great movie", "a cinematic masterpiece", "a person"]]
        ]
    
    let answers = [
        ["the powerhouse of the cell", "hydrogen", "a made up subject"],
        ["on the SATs", "impossible to say", "at least 12"],
        ["captain bulgaria", "steve rogers", "a person"]
    
        ]
    
    let images = ["shield.fill", "heart.circle", "function"]
    var body: some View {
       
        NavigationView {
            VStack{
            List {
                
                ForEach(categories.indices) { i in
                    HStack {
                        Image(systemName: "questionmark.diamond.fill")
                    VStack(alignment: .leading) {
                        NavigationLink(destination: QuizView(quiz: questions[i], answers: answers[i], options: options[i], index: 0)) {
                        Text(categories[i])
                            .font(.title3)
                            .foregroundColor(.blue)
                        }
                        Text(descrips[i])
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
