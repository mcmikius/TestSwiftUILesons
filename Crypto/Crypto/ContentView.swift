//
//  ContentView.swift
//  Crypto
//
//  Created by Mykhailo Bondarenko on 31.10.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Your crypto balance")
                Text("$3,133.7")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                List {
                    Text("Item 1")
                    Text("Item 2")
                }.listStyle(GroupedListStyle())
            } .navigationBarTitle(Text("Dashboard")).navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
