//
//  ContentView.swift
//  BullsEye
//
//  Created by Nitin Yadav on 30/08/20.
//  Copyright © 2020 Nitin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var alertVisible = false
    var body: some View {
        VStack {
            Button(action: {
                self.alertVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
            }
            .alert(isPresented: $alertVisible) { () -> Alert in
                return Alert(title: Text("Hola!"), message: Text("Welcome to the New App"), dismissButton: .default(Text("Dismiss!")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
