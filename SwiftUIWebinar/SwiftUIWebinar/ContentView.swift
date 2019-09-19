//
//  ContentView.swift
//  SwiftUIWebinar
//
//  Created by Mykhailo Bondarenko on 19.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { geometry in
                    HStack(spacing: 20.0) {
                        NavigationLink(destination: ChannelView(), label: {
                            Text("Edit channel")
                        }).frame(width: geometry.size.width / 2 - 10, height: 50).accentColor(Color.init(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))).background(Color.init(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))).cornerRadius(10)
                        Button(action: {
                            print("Pressed")
                        }, label: {
                            Text("Edit content")
                        }).frame(width: geometry.size.width / 2 - 10, height: 50).accentColor(Color.init(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))).background(Color.init(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))).cornerRadius(10)
                    }
                }.padding().frame(height: 50)
                Divider()
                Text("Hello world!")
                Spacer()
            }.navigationBarTitle(Text("Swiftbook.ru"))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
