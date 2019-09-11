//
//  ContentView.swift
//  SimpleApp
//
//  Created by Mykhailo Bondarenko on 11.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(developers) { developer in
                NavigationLink(destination: ContentDetailView(codeName: developer.codeName)) {
                    ContentRowView(codeName: developer.codeName)
                }
            }.navigationBarTitle(Text("Developers"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
