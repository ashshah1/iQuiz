//
//  ContentView.swift
//  iQuiz
//
//  Created by Ashni Shah on 5/6/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false;
    let categories =
        ["Marvel Superheroes": "A category about Marvel Superheroes",
         "Science": "beakers and what not",
         "Mathematics": "2 plus 2 is 5 right"]
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(categories.sorted(by: >), id: \.key) { key, value in
                        VStack(alignment: .leading) {
                            Text(key)
                                .font(.title3)
                                .foregroundColor(.blue)
                            Text(value)
                                .font(.body)
                        }
                        .padding()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            self.showAlert = true
                        }, label: {
                            Text("settings")
                        }).alert(isPresented: $showAlert) { () -> Alert in
                            Alert(title: Text("Settings"), message: Text("Your settings go here"))
                        }
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
