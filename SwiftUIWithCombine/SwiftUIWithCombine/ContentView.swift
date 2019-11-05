//
//  ContentView.swift
//  SwiftUIWithCombine
//
//  Created by Mykhailo Bondarenko on 05.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let users = [User(name: "person 1", email: "person1@gmail.com", phoneNum: "678359234", imageUrl: "https://icon-library.net/images/user-image-icon/user-image-icon-17.jpg"), User(name: "person 2", email: "person2@gmail.com", phoneNum: "678359234", imageUrl: "https://static.thenounproject.com/png/17241-200.png"), User(name: "person 3", email: "person3@gmail.com", phoneNum: "678359234", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYm-KcyvHy3PDkmh0V9KzkUk26255h0RwthshiaoanTnfH2B_IRg")]
    var body: some View {
        NavigationView{
            List {
                ForEach(users) { user in
                ContentItemView(user: user)
                }
            }
        .navigationBarTitle(Text("Users"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
