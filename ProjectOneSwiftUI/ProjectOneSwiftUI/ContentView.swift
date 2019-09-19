//
//  ContentView.swift
//  ProjectOneSwiftUI
//
//  Created by Mykhailo Bondarenko on 19.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//
import Combine
import SwiftUI

class DataSource: BindableObject {
    
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
            }.navigationBarTitle(Text("Storm viewer"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
