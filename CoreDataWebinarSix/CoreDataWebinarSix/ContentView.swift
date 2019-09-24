//
//  ContentView.swift
//  CoreDataWebinarSix
//
//  Created by Mykhailo Bondarenko on 23.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State private var newOrder = ""
    @FetchRequest(entity: Order.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Order.drink, ascending: true)]) var orders: FetchedResults<Order>
    
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("New Order")) {
                    HStack {
                        TextField("New Order", text: $newOrder)
                        Button(action: {
                            print("Create")
                            let order = Order(context: self.managedObjectContext)
                            order.drink = self.newOrder
                            order.createdAt = Date()
                            do {
                                try self.managedObjectContext.save()
                            } catch {
                                print(error)
                            }
                            self.newOrder = ""
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                        })
                    }
                }
                Section(header: Text("Your orders")) {
                    ForEach(self.orders, id: \.self) { order in
                        OrderItemView(drink: order.drink!, createAt: "\(String(describing: order.createdAt))")
                    }.onDelete(perform: removeOrder)
                }
            }.navigationBarTitle(Text("OrderView"))
                .navigationBarItems(trailing: EditButton())
        }
    }
    func removeOrder(at offsets: IndexSet) {
        for index in offsets {
            let order = orders[index]
            managedObjectContext.delete(order)
            do {
                try self.managedObjectContext.save()
            } catch {
                print(error)
            }
        }
    }
}

struct OrderItemView: View {
    var drink: String = ""
    var createAt: String = ""
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(drink).font(.headline)
                Text(createAt).font(.subheadline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
