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
    
    struct labelStyle : ViewModifier {
        func body(content : Content) -> some View {
            return content
                .foregroundColor(Color.white)
                .modifier(shadow())
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    struct numberStyle : ViewModifier {
        func body(content : Content) -> some View {
            return content
                .foregroundColor(Color.yellow)
                .modifier(shadow())
                .font(Font.custom("Arial Rounded MT Bold", size: 22))
        }
    }
    struct shadow : ViewModifier {
        func body(content : Content) -> some View {
            return content
                .shadow(color: Color.black, radius: 7, x: 2, y: 2)
        }
    }
    
    
    var body: some View {
        VStack {
            Spacer()
            
            //Target Row
            HStack {
                Text("Hit The Slider to :").modifier(labelStyle())
                Text("\(self.target)").modifier(numberStyle())
            }
            Spacer()
            
            //Slider Row
            HStack{
                Text("1").modifier(labelStyle())
                Slider(value: self.$sliderValue, in: 1...100).accentColor(Color.green)
                Text("100").modifier(labelStyle())
            }
            Spacer()
            
            //Button Row
            Button(action: {
                self.alertVisible = true
                self.score += self.pointsForCurrentRound()
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/).modifier(labelStyle())
            }
            .alert(isPresented: $alertVisible) { () -> Alert in
                return Alert(title: Text("\(alertMessage())"), message: Text("Slider Value is \(sliderValueRounded()).\n" +
                    "You scored \(self.pointsForCurrentRound()) points in this round"
                ), dismissButton: .default(Text("Play Again!")){
                    self.target = Int.random(in: 1...100)
                    self.currentRound += 1
                    })
            }
            .background(Image("Button"), alignment: .center)
            Spacer()
            
            //Score Row
            HStack{
                Button(action: {
                    self.newGame()
                }) {
                    HStack{
                        Image("StartOverIcon")
                        Text("Refresh").modifier(labelStyle())
                    }
                }.background(Image("Button"), alignment: .center)
                Spacer()
                Text("Score:").modifier(labelStyle())
                Text("\(score)").modifier(numberStyle())
                Spacer()
                Text("Round:").modifier(labelStyle())
                Text("\(currentRound)").modifier(numberStyle())
                Spacer()
//                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
//                    HStack{
//                        Image("InfoIcon")
//                        Text("Info").modifier(labelStyle())
//                    }
//                }.background(Image("Button"), alignment: .center)
                
                NavigationLink(destination : AboutPage()) {
                    HStack{
                        Image("InfoIcon")
                        Text("Info").modifier(labelStyle())
                    }
                }.background(Image("Button"), alignment: .center)
                
            }
            .padding(.bottom , 20)
        }
        .background(Image("Background"), alignment: .center)
        .accentColor(Color.blue)
        .navigationBarTitle("BullsEye")
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
