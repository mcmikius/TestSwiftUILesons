//
//  ItemRowView.swift
//  UnderstandSwiftUIPropertyWrapper
//
//  Created by Mykhailo Bondarenko on 12.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ItemRowView: View {
    
    var item: RandomItem
    
    var body: some View {
        HStack {
            Text(item.name)
            Spacer()
            if item.favorite {
                Text("⭐️")
            }
        }
        .padding()
    }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(item: itemData[0])
    }
}
