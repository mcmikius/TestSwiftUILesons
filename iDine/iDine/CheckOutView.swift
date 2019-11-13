//
//  CheckOutView.swift
//  iDine
//
//  Created by Mykhailo Bondarenko on 13.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct CheckOutView: View {
    @EnvironmentObject var order: Order
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    static let tipAmounts = [10, 15, 20, 25, 0]
    static let pickupTimeTypes = ["Now", "Tonight", "Tomorrow Morning"]
    
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var paymentType = 0
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    @State private var addPickupTime = false
    @State private var pickupTimeType = 1
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Add iDine loyalty card")
                }
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Pickup time")) {
                Toggle(isOn: $addPickupTime.animation()) {
                    Text("Add Pickup time")
                }
                if addPickupTime {
                    Picker(selection: $pickupTimeType, label: Text("")) {
                        ForEach(0 ..< Self.pickupTimeTypes.count) {
                            Text(Self.pickupTimeTypes[$0])
                        }
                    }.pickerStyle(WheelPickerStyle())
                }
            }
            Section(header: Text("TOTAL: $\(totalPrice, specifier: "%.2f")").font(.largeTitle)) {
                VStack(alignment: .center) {
                    Button("Confirm order") {
                        self.showingPaymentAlert.toggle()
                    }.frame(width: 320.0, alignment: .center).font(.headline).padding().background(Color.blue).cornerRadius(8).foregroundColor(.white)
                }
                .padding(.horizontal)
            }
        }.navigationBarTitle(Text("Payment"), displayMode: .inline).alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f") - thank you!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckOutView().environmentObject(order)
    }
}
