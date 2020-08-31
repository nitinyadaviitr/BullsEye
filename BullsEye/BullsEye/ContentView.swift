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
    @State var score = 0
    @State var currentRound = 1
    
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
                self.score += self.pointsForCurrentRound()
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
            }
            .alert(isPresented: $alertVisible) { () -> Alert in
                return Alert(title: Text("\(alertMessage())"), message: Text("Slider Value is \(sliderValueRounded()).\n" +
                    "You scored \(self.pointsForCurrentRound()) points in this round"
                ), dismissButton: .default(Text("Play Again!")){
                    self.target = Int.random(in: 1...100)
                    self.currentRound += 1
                    })
            }
            Spacer()
            
            //Score Row
            HStack{
                Button(action: {
                    self.newGame()
                }) {
                   Text("Start Over")
                }
                Spacer()
                Text("Score:")
                Text("\(score)")
                Spacer()
                Text("Round:")
                Text("\(currentRound)")
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
        let maxScore = 100
        let difference = abs(sliderValueRounded() - self.target)
        let bonus : Int
        if difference == 0{
            bonus = 100
        }
        else if difference <= 3{
            bonus = 50
        }
        else{
            bonus = 0
        }
        return maxScore - difference + bonus
    }
    
    func newGame(){
        currentRound = 1
        score = 0
        target = Int.random(in: 1...100)
        sliderValue = 50.0
    }
    
    func alertMessage() -> String{
        let difference = abs(sliderValueRounded() - self.target)
        let title : String
        if difference == 0{
            title = "Perfect!"
        }
        else if difference <= 10{
            title = "You were close!"
        }
        else{
            title = "Are You even Trying?"
        }
        return title
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(
            .fixed(width: 896, height: 414))
    }
}
