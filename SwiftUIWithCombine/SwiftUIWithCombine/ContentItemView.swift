//
//  ContentItemView.swift
//  SwiftUIWithCombine
//
//  Created by Mykhailo Bondarenko on 05.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct ContentItemView: View {
    @State var user: User
    var body: some View {
        HStack {
            KFImage(URL(string: (self.user.imageUrl))!).resizable().clipShape(Circle()).frame(width: 70, height: 70)
            VStack(alignment: .leading) {
                Text(user.name)
                Spacer()
                Text(user.email)
                Spacer()
                Text(user.phoneNum)
                Spacer()
            }.padding(.init(top: 2, leading: 8, bottom: 2, trailing: 8))
        }.padding(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
    }
}


struct ContentItemView_Previews: PreviewProvider {
    static var previews: some View {
        ContentItemView(user: User(name: "Vasia", email: "Petya", phoneNum: "8049847483", imageUrl: "https://miro.medium.com/max/682/1*MTiY9k7aLbSBDrXa8uIJuQ.jpeg"))
    }
}
