//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Yusuke Tomatsu on 2020/02/08.
//  Copyright © 2020 Yusuke Tomatsu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia","France","Germany","Ireland","Italy","Nigeria","Poland","Rusiia","Spain","UK","US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue,.black]),startPoint: .top,endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30 ){
                VStack {
                    Text("Tap the frag of ")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ForEach(0..<3){ number in
                    Button(action:{
                        //falg was tapped
                        self.fragTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                    }
                }
                Spacer()
            }
        }
        .alert(isPresented: $showingScore){
            Alert(title:Text(scoreTitle), message: Text("Your score is ???"), dismissButton: .default(Text("continue")){
                self.askQuestion()
                })
        }
    }
    
    func fragTapped(_ number: Int){
        if number == correctAnswer{
            scoreTitle = "Correct"
        }else{
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
