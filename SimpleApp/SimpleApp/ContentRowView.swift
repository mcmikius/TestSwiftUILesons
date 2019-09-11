//
//  ContentRowView.swift
//  SimpleApp
//
//  Created by Mykhailo Bondarenko on 11.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ContentRowView: View {
    
    var codeName: String
    
    var body: some View {
        HStack {
            Image(codeName)
                .resizable()
                .scaledToFill()
                .frame(width: 96.0, height: 96.0)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text("Codename: \(codeName)")
                    .font(.title)
                Text(/*@START_MENU_TOKEN@*/"Another great developer"/*@END_MENU_TOKEN@*/)
            }
//            Spacer()
        }
        .padding()
    }
}

struct ContentRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContentRowView(codeName: "one")
    }
}
