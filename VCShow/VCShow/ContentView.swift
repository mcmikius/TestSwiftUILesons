//
//  ContentView.swift
//  VCShow
//
//  Created by Mykhailo Bondarenko on 13.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingSecondVC = false
    @ObservedObject var videoIdea = VideoIdea()
    @EnvironmentObject var channelData: ChannelData
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text(videoIdea.title)
                    .font(.title)
                Text(videoIdea.contentIdea)
                .font(.subheadline)
                Divider()
                NavigationLink(destination: ChannelView()) {
                    Text("Add channel")
                }
                Button(action: {
                    self.showingSecondVC.toggle()
                }) {
                    Text("Add new Idea")
                }
                .sheet(isPresented: $showingSecondVC) {
                    SecondView(videoTitle: self.$videoIdea.title, videoContent: self.$videoIdea.contentIdea).environmentObject(self.channelData)
                }
                Spacer()
            }
        .padding()
            .navigationBarTitle("\(channelData.channelName)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
