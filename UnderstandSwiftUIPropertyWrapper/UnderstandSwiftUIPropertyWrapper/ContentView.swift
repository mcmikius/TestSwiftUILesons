//
//  ContentView.swift
//  UnderstandSwiftUIPropertyWrapper
//
//  Created by Mykhailo Bondarenko on 11.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var favoritesOnly = false
    @State var displayAlert = false
    @EnvironmentObject var dataStore: DataStore
    
    var body: some View {
        List {
            Toggle(isOn: $favoritesOnly) {
                Text("⭐️ only")
            }
            .padding(.leading)
            ForEach (itemData) { item in
                if !self.favoritesOnly || item.favorite {
                    ItemRowView(item: item)
                }
            }
        }
    .onAppear(perform: showAlert)
        .alert(isPresented: $displayAlert) {
            Alert(title: Text("Welcome"), message: Text("Welcome to the greate app"), dismissButton: .default(Text("Let's start")))
        }
    }
    func showAlert() {
        if dataStore.firstLaunch {
            displayAlert = true
            dataStore.firstLaunch = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(DataStore)
    }
}
