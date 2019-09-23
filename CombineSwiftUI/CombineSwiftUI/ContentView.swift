//
//  ContentView.swift
//  CombineSwiftUI
//
//  Created by Mykhailo Bondarenko on 23.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI
import Combine

//class UserAuthentication: ObservableObject {
//    let objectWillChange = ObservableObjectPublisher()
//    var username = "" {
//        willSet {
//            objectWillChange.send()
//        }
//    }
//}

class UserSettings: ObservableObject {
    @Published var username: String = ""
}

struct ContentView: View {
    @ObservedObject var settings = UserSettings()
    
    var body: some View {
        VStack {
            TextField("Username", text: $settings.username).textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Your name is: \(settings.username)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
