//
//  ContentView.swift
//  SwiftBookApp
//
//  Created by Mykhailo Bondarenko on 17.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(userResponse) { user in
                CellView(user: user)
            }
        .navigationBarTitle(Text("Friends"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
