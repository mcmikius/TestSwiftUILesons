//
//  PersonCellView.swift
//  SwiftUICoreData
//
//  Created by Mykhailo Bondarenko on 24.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct PersonCellView: View {
    
    var image: Image
    var favoriteImage: Image
    var gender: String = ""
    var age: String = ""
    var firstName: String = ""
    var lastName: String = ""
    
    var body: some View {
        HStack {
            ZStack {
                image.resizable().frame(width: 110, height: 110, alignment: .center).clipShape(Circle()).shadow(color: .secondary, radius: 7).padding(.all, 10)
                favoriteImage.resizable().frame(width: 22, height: 22).offset(x: 45, y: 45).foregroundColor(.yellow).shadow(color: .white, radius: 3)
            }
            VStack(alignment: .leading) {
                HStack {
                    Text("first name: ").font(.callout).foregroundColor(.secondary)
                    Text(firstName).underline(color: .red)
                }
                HStack {
                    Text("last name: ").font(.callout).foregroundColor(.secondary)
                    Text(lastName).underline(color: .red)
                }
                HStack {
                    Text("age: ").font(.callout).foregroundColor(.secondary)
                    Text(age)
                }
                HStack {
                    Text("gender: ").font(.callout).foregroundColor(.secondary)
                    Text(gender)
                }
            }.padding(.horizontal, 25).foregroundColor(.primary).font(.custom("American typewritter", size: 18))
        }
    }
}

struct PersonCellView_Previews: PreviewProvider {
    static var previews: some View {
        PersonCellView(image: Image(uiImage: UIImage(systemName: "plus.circle")!), favoriteImage: Image(systemName: "star"))
    }
}
