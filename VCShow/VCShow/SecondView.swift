//
//  SecondView.swift
//  VCShow
//
//  Created by Mykhailo Bondarenko on 13.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding <PresentationMode>
    
    @Binding var videoTitle: String
    @Binding var videoContent: String
    @EnvironmentObject var channelData: ChannelData
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextField("Video title", text: $videoTitle)
                TextField("Video content", text: $videoContent)
                Divider()
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Dismiss this VC")
                }
                Spacer()
            }
        .padding()
            .navigationBarTitle("\(channelData.channelName) Video")
        }
    }
}

//struct SecondView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondView(videoTitle: , videoContent: <#Binding<String>#>)
//    }
//}
