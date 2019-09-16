//
//  ContentView.swift
//  Bullseye
//
//  Created by Mykhailo Bondarenko on 13.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    
    //TODO: - remember to delete this later on!
    
    //@State var whosThereIsVisible: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            //            MARK: - Target row
            HStack {
                Text("Put the bullseye as close as you can to: ")
                Text("\(target)")
            }
            Spacer()
            //            MARK: - Slider row
            HStack {
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            //            MARK: - Button row
            Button(action: {
                print("Button pressed!")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                return Alert(title: Text("Hello there!"), message: Text("The slider's value is \(sliderValueRounded()).\n" + "Your scored \(pointsForCurrentRound()) points this round"), dismissButton: .default(Text("Awesome")))
            }
            Spacer()
            /*
             Button(action: {
             print("Button pressed!")
             self.whosThereIsVisible = true
             }) {
             Text("Knock, knock!")
             }
             .alert(isPresented: $whosThereIsVisible) { () -> Alert in
             return Alert(title: Text("Who's there?"), message: Text("Little old lady"), dismissButton: .default(Text("Little old lady, who?")))
             }
             */
            
            //            MARK: - Score row
            HStack {
                Button(action: {
                    print("Button pressed!")
                }) {
                    Text("Start over")
                }
                Spacer()
                Text("Score: ")
                Text("999999")
                Spacer()
                Text("Round: ")
                Text("999")
                Spacer()
                Button(action: {
                    print("Button pressed!")
                }) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
        }
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func pointsForCurrentRound() -> Int {
        100 - abs(target - sliderValueRounded())
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
