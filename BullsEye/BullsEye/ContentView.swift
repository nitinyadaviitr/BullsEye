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
    @State var target = Int.random(in: 1...100)
    
    var body: some View {
        VStack {
            Spacer()
            
            //Target Row
            HStack {
                Text("Hit The Slider to :")
                Text("\(self.target)")
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
                return Alert(title: Text("Hola!"), message: Text("Slider Value is \(sliderValueRounded()).\n" +
                    "You scored \(self.pointsForCurrentRound()) points in this round"
                ), dismissButton: .default(Text("Dismiss!")))
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
    
    func sliderValueRounded() -> Int {
        Int(self.sliderValue.rounded())
    }
    
    func pointsForCurrentRound()-> Int{
        100 - abs(sliderValueRounded() - self.target)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(
            .fixed(width: 896, height: 414))
    }
}
