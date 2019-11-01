//
//  LoginView.swift
//  Crypto
//
//  Created by Mykhailo Bondarenko on 01.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Your username", text: $username)
                SecureField("Your Passwird", text: $password)
                HStack {
                    Spacer()
                    Button(action: {
                        print("Login")
                    }) {
                        Text("Login")
                            .foregroundColor(Color.white).padding(.horizontal, 20).padding([.top, .bottom], 15)
                            .background(/*@START_MENU_TOKEN@*/Color.red/*@END_MENU_TOKEN@*/).cornerRadius(10)
                    }
                    Spacer()
                }
            }
        }.navigationBarTitle(Text("NiceCrypto"))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
