//
//  ContentView.swift
//  Headlines
//
//  Created by Mykhailo Bondarenko on 02.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
           VStack(alignment: .leading) {
               Text("Building the UI")
               List {
                   CategoryRow()
               }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
