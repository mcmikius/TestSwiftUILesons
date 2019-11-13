//
//  ContentView.swift
//  SwiftUIWithCombine
//
//  Created by Mykhailo Bondarenko on 05.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel: UsersViewModel = UsersViewModel()
    var body: some View {
        NavigationView{
            List {
                ForEach(viewModel.users) { user in
                ContentItemView(user: user)
                }
            }
        .navigationBarTitle(Text("Users"))
        }.onAppear(){
            self.viewModel.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
