//
//  DrinkRow.swift
//  CoffeeDBApp
//
//  Created by Mykhailo Bondarenko on 06.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct DrinkRow: View {
    
    var categoryName: String
    var drinks: [Drink]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.title)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach (self.drinks, id: \.self) { drink in
                        DrinkItem(drink: drink)
                        .frame(width: 300)
                            .padding(.trailing, 30)
                    }
                }
            }
        }
    }
}

struct DrinkRow_Previews: PreviewProvider {
    static var previews: some View {
        DrinkRow(categoryName: "HOT DRINKS", drinks: drinkData)
    }
}
