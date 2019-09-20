//
//  ChannelView.swift
//  SwiftUIWebinar
//
//  Created by Mykhailo Bondarenko on 19.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ChannelView: View {
    
    @EnvironmentObject var channelData: ChannelModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextField("Channel name", text: $channelData.channelName)
                Divider()
                Button(action: {
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

//struct ChannelView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChannelView()
//    }
//}
