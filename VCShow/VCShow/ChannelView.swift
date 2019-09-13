//
//  ChannelView.swift
//  VCShow
//
//  Created by Mykhailo Bondarenko on 13.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ChannelView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding <PresentationMode>
    @EnvironmentObject var channelData: ChannelData
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextField("Channel name", text: $channelData.channelName)
                Divider()
                Button (action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Dismiss this VC")
                }
                Spacer()
            }
        .padding()
        .navigationBarTitle("Channel Data")
        }
    }
}

struct ChannelView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelView()
    }
}
