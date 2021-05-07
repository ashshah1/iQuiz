//
//  ContentView.swift
//  iQuiz
//
//  Created by Ashni Shah on 5/6/21.
//

import SwiftUI

struct ContentView: View {
    @State var showAlert = false;
    let categories =
        ["Marvel Superheroes": "superheroes for 500 please, alex",
         "Science": "beakers and what not",
         "Mathematics": "2 plus 2 is 5 right"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(categories.sorted(by: >), id: \.key) { key, value in
                    VStack(alignment: .leading) {
                        Text(key)
                            .font(.title3)
                            .foregroundColor(.blue)
                        Text(value)
                            .font(.body)
                            .foregroundColor(.green)
                    }
                    .padding()
                }
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.showAlert = true
                    }, label: {
                        Text("Settings")
                    }).alert(isPresented: $showAlert) { () -> Alert in
                        Alert(title: Text("Settings"), message: Text("Settings go here"), dismissButton: .default(Text("Ok")))
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
