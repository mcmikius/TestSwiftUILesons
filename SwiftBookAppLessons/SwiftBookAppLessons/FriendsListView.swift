//
//  ContentView.swift
//  SwiftBookAppLessons
//
//  Created by Mykhailo Bondarenko on 8/15/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct FriendsListView: View {
    var body: some View {
        NavigationView {
            List(userResponse) { user in
                CellView(user: user)
                
            }
        .navigationBarTitle(Text("Friends"))
        }
        
    }
}

#if DEBUG
struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView()
    }
}
#endif
