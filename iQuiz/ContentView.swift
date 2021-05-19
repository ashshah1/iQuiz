//
//  ContentView.swift
//  iQuiz
//
//  Created by Ashni Shah on 5/6/21.
//

import SwiftUI


struct Quiz: Identifiable, Codable {
    var id: String { title }
    var title: String
    var desc: String
    var questions: [Question]

}

struct Question: Identifiable, Codable {
    var id: String { text }
    let text: String
    let answers: [String]
    let answer: String
}


struct ContentView: View {
    @State var quizzes = [Quiz]()
    @State var showAlert = false;
    @State var showQuiz = false;
    @State var dataURL = "https://tednewardsandbox.site44.com/questions.json"
    
    
    var body: some View {

        NavigationView {
            VStack{
                List (quizzes, id: \.title) { quiz in
                        HStack {
                            Image(systemName: "questionmark.diamond.fill")
                            VStack(alignment: .leading) {
                                NavigationLink(destination: QuizView(quiz: quiz, index: 0)) {
                                    Text(quiz.title)
                                        .font(.title3)
                                        .foregroundColor(.blue)
                                }
                                Text(quiz.desc)
                                    .font(.body)
                            }
                            .padding()
                        }
                    }.onAppear(perform: loadData)
                    
                
                
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


extension ContentView
{
    func loadData() {
        
        guard let url = URL(string: dataURL) else {
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                if let response_obj = try? JSONDecoder().decode([Quiz].self, from: data) {
                    
                    DispatchQueue.main.async {
                        self.quizzes = response_obj
                    }
                }
            }
            
        }.resume()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
