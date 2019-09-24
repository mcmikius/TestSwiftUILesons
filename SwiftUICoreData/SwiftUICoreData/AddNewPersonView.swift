//
//  AddNewPersonView.swift
//  SwiftUICoreData
//
//  Created by Mykhailo Bondarenko on 24.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct AddNewPersonView: View {
    
    @State private var addImage = false
    @Binding var image: UIImage?
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var age: String
    @Binding var segmentedControl: Int
    @Binding var isFavorite: Bool
    
    var body: some View {
        VStack {
            Image(uiImage: image ?? UIImage(systemName: "plus.circle")!).resizable().scaledToFit().clipShape(Circle()).padding().shadow(color: .secondary, radius: 7).onTapGesture {
                self.addImage.toggle()
            }
            VStack {
                TextField("First name", text: self.$firstName).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Last name", text: self.$lastName).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Age", text: self.$age).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Picker(selection: self.$segmentedControl, label: Text("")) {
                Text("Male").tag(0)
                Text("Female").tag(1)
            }.padding().shadow(color: .secondary, radius: 3).pickerStyle(SegmentedPickerStyle())
            Image(systemName: self.isFavorite ? "star.fill" : "star").resizable().frame(width: 50, height: 50).foregroundColor(.yellow).shadow(color: self.isFavorite ? .primary : .secondary, radius: 3).onTapGesture {
                self.isFavorite.toggle()
            }
            Spacer()
            
        }.sheet(isPresented: self.$addImage) {
            ImagePickerView(showImagePicker: self.$addImage, image: self.$image)
        }.padding()
    }
}

struct AddNewPersonView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPersonView(image: .constant(UIImage(systemName: "plus.circle")), firstName: .constant("John"), lastName: .constant("Dou"), age: .constant("..."), segmentedControl: .constant(0), isFavorite: .constant(true))
    }
}
