//
//  ContentView.swift
//  UnsplashClient
//
//  Created by Mykhailo Bondarenko on 30.10.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: UnsplashStore
    var body: some View {
        Group {
            
                NavigationView {
                    List(store.models, rowContent: RowView.init).navigationBarTitle(Text("Photographers"))
                
            }
        }.onAppear(perform: store.fetch)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: UnsplashStore())
    }
}

struct RowView: View {
    let model: Model
    var body: some View {
        return HStack{
            Image(uiImage: model.image)
                .frame(width: 50.0, height: 50)
                .scaledToFit().shadow(radius: 10)
            VStack(alignment: .leading) {
                Text(model.name)
                Text(model.bio)
                    .font(.subheadline).foregroundColor(.secondary)
            }
        }
    }
}
