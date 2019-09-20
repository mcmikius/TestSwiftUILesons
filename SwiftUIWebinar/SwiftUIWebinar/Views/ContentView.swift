//
//  ContentView.swift
//  SwiftUIWebinar
//
//  Created by Mykhailo Bondarenko on 19.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var showingVideoView = false
    @ObservedObject var videoData = VideoModel()
    @EnvironmentObject var channelData: ChannelModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                GeometryReader { geometry in
                    HStack(spacing: 20.0) {
                        NavigationLink(destination: ChannelView(), label: {
                            Text("Edit channel")
                        }).frame(width: geometry.size.width / 2 - 10, height: 50).accentColor(Color.init(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))).background(Color.init(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))).cornerRadius(10)
                        Button(action: {
                            print("Pressed")
                            self.showingVideoView.toggle()
                        }, label: {
                            Text("Edit content")
                        }).sheet(isPresented: self.$showingVideoView, content: {
                            VideoView(videoTitle: self.$videoData.title, videoDescription: self.$videoData.description).environmentObject(self.channelData)
                        }).frame(width: geometry.size.width / 2 - 10, height: 50).accentColor(Color.init(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))).background(Color.init(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))).cornerRadius(10)
                    }
                }.padding().frame(height: 50)
                Divider()
                HStack {
                    Image("apple").resizable().frame(width: 120, height: 120)
                    VStack(alignment: .leading) {
                        Text("Title: \(videoData.title)").font(.title)
                        Text("Description: \(videoData.description)").font(.subheadline).foregroundColor(.gray)
                    }
                }
                Spacer()
                }.padding()
                .navigationBarTitle(Text("\(channelData.channelName)"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
