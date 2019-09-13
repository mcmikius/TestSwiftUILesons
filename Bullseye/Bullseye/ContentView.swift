//
//  ContentView.swift
//  Bullseye
//
//  Created by Mykhailo Bondarenko on 13.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    
    //TODO: - remember to delete this later on!
    
    //@State var whosThereIsVisible: Bool = false
    
    var body: some View {
        VStack {
            Text("Welcome to my first app")
                .fontWeight(.semibold)
                .foregroundColor(Color.green)
            Button(action: {
                print("Button pressed!")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                return Alert(title: Text("Hello there!"), message: Text("this is my first pop-up"), dismissButton: .default(Text("Awesome")))
            }
            
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
