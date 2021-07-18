//
//  ContentView.swift
//  RPS
//
//  Created by Filatov Yurii on 18.07.2021.
//

import SwiftUI

struct ContentView: View {
    let selectionTypes = ["Rock 👊", "Paper ✋", "Scissors ✌️"]
    
    @State private var mySelection = ""
    @State private var winOrLuse = true
    @State private var playerScore = 0
    @State private var appResalt = ""
    @State private var status = ""
    @State private var message = ""
    @State private var gameOver = false
    @State private var attempt = 0
    
    struct TitleView:View {
        var title: String
        
        var body: some View{
            Text(title)
                .font(.title3)
                .foregroundColor(.black)
                .fontWeight(.bold)
        }
    }
   
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors:[.orange, .white]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all)
            VStack(spacing:20){
                VStack{
                    Text ("Attempt \(attempt) / 10")
                        .padding(20)
                    Text("Your score is: \(playerScore)")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    
                }
                        
                
                VStack{
                    HStack(spacing: 10){
                        ForEach(0..<selectionTypes.count){num in
                            Button(action:{
                                mySelection = selectionTypes[num]
                                appSelection()
                                resert()
                            }, label:{
                                TitleView(title: selectionTypes[num])
                                    
                            })
                            .alert(isPresented: $gameOver){
                                Alert(title: Text ("Game Over"), message: Text("You final score is \(playerScore)"), dismissButton: .default(Text("Restart")){
                                    playerScore = 0
                                    message = ""
                                })
                            }
                        }
                    }
                    Spacer()
                }
                
                VStack{
                    Text("You selection is \(mySelection)")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Text("App selection is \(appResalt)")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Text("You \(status)")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                }
            }
        }
    }
    
    
    func appSelection () -> String{
        winOrLuse = Bool.random()
        attempt += 1
        
        switch mySelection {
        case "Rock 👊":
            if winOrLuse == true{
                appResalt = "Scissors ✌️"
                playerScore += 1
                status = "Win"
                
            }else{
                appResalt = "Paper ✋"
                status = "Lose"
            }
            return appResalt
            
        case "Scissors ✌️":
            if winOrLuse == true{
                appResalt = "Paper ✋"
                playerScore += 1
                status = "Win"
            }else{
                appResalt = "Rock 👊"
                status = "Lose"
            }
            return appResalt
            
        case "Paper ✋":
            if winOrLuse == true{
                appResalt = "Rock 👊"
                playerScore += 1
                status = "Win"
            }else{
                appResalt = "Scissors ✌️"
                status = "Lose"
            }
            return appResalt
        
        default:
            return appResalt
        }
        
    }
    
    func resert() {
        if attempt == 10 {
            gameOver = true
            attempt = 0
        }
    }    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
