//
//  ItemDetailView.swift
//  iDine
//
//  Created by Mykhailo Bondarenko on 13.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ItemDetailView: View {
    @EnvironmentObject var order: Order
    var item: MenuItem
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)").padding(4).background(Color.black).font(.caption).foregroundColor(.white).offset(x: -5, y: -5)
            }
            Text(item.description).padding()
            Button("Order This"){
                self.order.add(item: self.item)
            }.font(.headline)
            Spacer()
        }.navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        NavigationView {
            ItemDetailView(item: MenuItem.example).environmentObject(order)
        }
    }
}
