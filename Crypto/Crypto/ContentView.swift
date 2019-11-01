//
//  ContentView.swift
//  Crypto
//
//  Created by Mykhailo Bondarenko on 31.10.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct Coin {
    let id, name, price, icon: String
    let lineCoordinates: [CGFloat]
}

struct GraphCoin: View {
    let title: String
    let lineCoordinates: [CGFloat]
    var body: some View {
        LineChartController(lineCoordinates: lineCoordinates, inline: false).padding(.leading, 30).navigationBarTitle(Text(title))
    }
}

struct BadgeSymbol: View {
    static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75
                let spacing = width * 0.028
                
                let middle = width / 2
                let topWidth = 0.226 * width
                let topHeight = 0.488 * height
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: spacing)
                ])
                
                path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
                path.addLines([
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: spacing, y: height - spacing),
                    CGPoint(x: width - spacing, y: height - spacing),
                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
                ])
            }.fill(BadgeSymbol.self.symbolColor)
        }
    }
}

struct ContentView: View {
    
    var rates: [Coin] = [
        Coin(id: "BTC", name: "Bitcoin", price: "9733.95", icon: "bitcoin", lineCoordinates: [5000, 10000, 7000, 9000, 12000, 10000]),
        Coin(id: "LTC", name: "Litecoin", price: "78.70", icon: "litecoin", lineCoordinates: [90.10, 90.00, 90.30, 90.10, 90.10, 90.20]),
        Coin(id: "XIP", name: "Ripple", price: "0.30", icon: "ripple", lineCoordinates: [0.2, 0.4, 0.3, 0.21, 0.25, 0.3]),
        Coin(id: "TRX", name: "Tron", price: "0.02", icon: "tron", lineCoordinates: [0.3, 0.45, 0.3, 0.6, 0.7, 0.1]),
        Coin(id: "ETH", name: "Ethereum", price: "200.45", icon: "ethereum", lineCoordinates: [200, 300.5, 250, 300, 290.9, 310])
    ]
    
    var myWallet: [Coin] = [
        Coin(id: "BTC", name: "Bitcoin", price: "1000.0", icon: "bitcoin", lineCoordinates: [5000, 10000, 7000, 9000, 12000, 10000]),
        Coin(id: "LTC", name: "Litecoin", price: "2000.0", icon: "litecoin", lineCoordinates: [90.10, 90.00, 90.30, 90.10, 90.10, 90.20]),
        Coin(id: "TRX", name: "Tron", price: "133.7", icon: "tron", lineCoordinates: [0.3, 0.45, 0.3, 0.6, 0.7, 0.1])
    ]
    
    
    @State var is360 = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    self.is360.toggle()
                }) {
                    BadgeSymbol().frame(width: 150, height: 150).rotation3DEffect(.degrees(is360 ? 360 : 0), axis: (x: 0, y: 1, z: 1)).animation(.easeIn(duration: 0.7))
                }
                
                Text("Your crypto balance")
                Text("$3,133.7")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                LineChartController(lineCoordinates: [3,2,5], inline: true)
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: 150
                ).padding()
                
                List {
                    Section(header: Text("My Wallet")) {
                        ForEach(myWallet, id: \.id) { coin in
                            HStack {
                                Image(coin.icon).resizable().frame(width: 40, height: 40)
                                Text("\(coin.name) (\(coin.id))")
                                Spacer()
                                Text("$\(coin.price)")
                                    .fontWeight(.bold)
                            }
                            
                        }
                    }
                    Section(header: Text("Current prices")) {
                        ForEach(rates, id: \.id) { coin in
                            
                            NavigationLink(destination: GraphCoin(title: coin.name, lineCoordinates: coin.lineCoordinates)) {
                                HStack {
                                    Image(coin.icon).resizable().frame(width: 40, height: 40)
                                    Text("\(coin.name) (\(coin.id))")
                                    Spacer()
                                    Text("$\(coin.price)")
                                        .fontWeight(.bold)
                                }
                            }
                        }
                    }
                    
                }.listStyle(GroupedListStyle())
            } .navigationBarTitle(Text("Dashboard")).navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
