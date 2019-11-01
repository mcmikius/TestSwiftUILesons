//
//  LoginView.swift
//  Crypto
//
//  Created by Mykhailo Bondarenko on 01.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI
import Combine

struct ServerMessage: Decodable {
    let status, message: String
}

class HttpAuth: ObservableObject {
    let objectWillChange = PassthroughSubject<HttpAuth, Never>()
    var authenticated = false {
        willSet {
            objectWillChange.send(self)
        }
    }
    func checkDetails(username: String, password: String) {
        guard let url = URL(string: "http://localhost/...") else { return }
        let body = ["username": username, "password": password]
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            let finalData = try! JSONDecoder().decode(ServerMessage.self, from: data)
            if finalData.status == "ok" {
                DispatchQueue.main.async {
                    self.authenticated = true
                }
            }
        }.resume()
    }
}

struct RootView: View {
    @State private var manager = HttpAuth()
    var body: some View {
        VStack {
            if manager.authenticated {
                ContentView()
            } else {
                LoginView(manager: $manager)
            }
        }
    }
}

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @Binding var manager: HttpAuth
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Your username", text: $username)
                SecureField("Your Passwird", text: $password)
                
                HStack {
                    Spacer()
                    Button(action: {
                        self.manager.checkDetails(username: self.username, password: self.password)
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

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView(manager: <#Binding<HttpAuth>#>)
//    }
//}
