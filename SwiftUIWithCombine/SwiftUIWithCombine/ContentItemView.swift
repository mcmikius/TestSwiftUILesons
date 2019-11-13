//
//  ContentItemView.swift
//  SwiftUIWithCombine
//
//  Created by Mykhailo Bondarenko on 05.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI
//import KingfisherSwiftUI

struct ContentItemView: View {
    @State var user: User
    var body: some View {
        HStack {
//            KFImage(URL(string: (self.user.picture.thumbnail!))!).resizable().clipShape(Circle()).frame(width: 70, height: 70)
            VStack(alignment: .leading) {
                Text(user.name.title + " " + user.name.first + " " + user.name.last)
                Spacer()
                Text(user.email)
                Spacer()
                Text(user.phone)
                Spacer()
            }.padding(.init(top: 2, leading: 8, bottom: 2, trailing: 8))
        }.padding(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
    }
}


//struct ContentItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentItemView(user: User(from: <#T##Decoder#>))
//    }
//}
