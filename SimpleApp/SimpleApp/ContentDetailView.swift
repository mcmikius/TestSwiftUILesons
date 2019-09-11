//
//  ContentDetailView.swift
//  SimpleApp
//
//  Created by Mykhailo Bondarenko on 11.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ContentDetailView: View {
    
    var codeName: String
    
    var body: some View {
        
        VStack {
            Image(codeName)
                .resizable()
                .scaledToFill()
                .frame(width: 128.0, height: 128.0)
                .clipShape(Circle())
            
            Text("Developer: \(codeName)")
                .font(.largeTitle)
        }
        .navigationBarTitle(Text(codeName), displayMode: .inline)
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView(codeName: "one")
    }
}
