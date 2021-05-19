//
//  ContentView.swift
//  iQuiz
//
//  Created by Ashni Shah on 5/6/21.
//
// Citations
// https://www.hackingwithswift.com/forums/swiftui/decoding-json-data/3024
// https://www.kaleidosblog.com/swiftui-how-to-download-and-parse-json-data-and-display-in-a-list-using-the-swift-ui-previewprovider
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
    let answer: String
    let answers: [String]
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
                    })
                }
            }.popover(isPresented: $showAlert) {
                VStack {
                    TextField("Enter a new data source", text: $dataURL)
                    Button(action: {
                        self.loadData()
                        showAlert = false
                    }) {
                        Text("check now")
                    }
                }
            }.onAppear(perform: loadData)
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
            
            do {
                if let data = data {
                    if let response_obj = try? JSONDecoder().decode([Quiz].self, from: data) {
                        
                        DispatchQueue.main.async {
                            self.quizzes = response_obj
                        }
                    }
                }
            } catch DecodingError.keyNotFound(let key, let context) {
                Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
            } catch DecodingError.valueNotFound(let type, let context) {
                Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.typeMismatch(let type, let context) {
                Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.dataCorrupted(let context) {
                Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
            } catch let error as NSError {
                NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
            }
            
        }.resume()
    }
    
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
