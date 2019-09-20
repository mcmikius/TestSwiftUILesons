//
//  VideoView.swift
//  SwiftUIWebinar
//
//  Created by Mykhailo Bondarenko on 19.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct VideoView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var videoTitle: String
    @Binding var videoDescription: String
    @EnvironmentObject var channelData: ChannelModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextField("Video title", text: $videoTitle)
                TextField("Video description", text: $videoDescription)
                Divider()
                Button(action: {
                    print("Presed")
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Dismiss")
                })
                Spacer()
            }.padding()
            .navigationBarTitle(Text("\(channelData.channelName)"))
        }
    }
}

//struct VideoView_Previews: PreviewProvider {
//    static var previews: some View {
//        VideoView(presentationMode: <#T##Environment<Binding<PresentationMode>>#>, videoTitle: <#T##Binding<String>#>, videoDescription: <#T##Binding<String>#>)
//    }
//}
