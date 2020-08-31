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
    @State var sliderValue = 50.0
    var body: some View {
        VStack {
            Spacer()
            
            //Target Row
            HStack {
                Text("Hit The Slider to :")
                Text(/*@START_MENU_TOKEN@*/"99"/*@END_MENU_TOKEN@*/)
            }
            Spacer()
            
            //Slider Row
            HStack{
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            
            //Button Row
            Button(action: {
                self.alertVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
            }
            .alert(isPresented: $alertVisible) { () -> Alert in
                var roundedValue : Int = Int(self.sliderValue.rounded())
                return Alert(title: Text("Hola!"), message: Text("Slider Value is \(roundedValue)"), dismissButton: .default(Text("Dismiss!")))
            }
            Spacer()
            
            //Score Row
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                   Text("Start Over")
                }
                Spacer()
                Text("Score:")
                Text("999999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Info")
                }
            }
            .padding(.bottom , 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(
            .fixed(width: 896, height: 414))
    }
}
