//
//  UpdatePersonView.swift
//  SwiftUICoreData
//
//  Created by Mykhailo Bondarenko on 24.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct UpdatePersonView: View {
    
    var personToUpdate: Person
    @Environment(\.managedObjectContext) var managedObjectContext
    @Binding var isActive: Bool
    @State private var addImage = false
    @State private var image: UIImage?
    @State private var isFavorite = false
    @State private var selectedSegment = 0
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var age = ""
    
    fileprivate func updatePerson() {
        self.personToUpdate.firstName = self.firstName.isEmpty ? self.personToUpdate.firstName : self.firstName
        self.personToUpdate.lastName = self.lastName.isEmpty ? self.personToUpdate.lastName : self.lastName
        self.personToUpdate.age = self.age.isEmpty ? self.personToUpdate.age : self.age
        self.selectedSegment == 0 ? (self.personToUpdate.gender = "male") : (self.personToUpdate.gender = "female")
        self.personToUpdate.isFavorite = self.isFavorite
        
        if let imageToData = self.image?.toJpegCompressedData {
            self.personToUpdate.photoData = imageToData
        }
        
        do {
            try self.managedObjectContext.save()
        } catch {
            print(error, error.localizedDescription)
        }
        
        withAnimation(.default) {
            self.isActive.toggle()
        }
    }
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            VStack {
                Image(uiImage: UIImage(data: personToUpdate.photoData!)!).resizable().clipShape(Circle()).frame(width: 250, height: 250).shadow(color: .init(.cyan), radius: 7).onTapGesture {
                    self.addImage.toggle()
                }.padding()
                VStack {
                    TextField(personToUpdate.firstName!, text: $firstName) {}
                    TextField(personToUpdate.lastName!, text: $lastName) {}
                    TextField(personToUpdate.age!, text: $age) {}
                }.textFieldStyle(RoundedBorderTextFieldStyle()).font(.custom("American typewriter", size: 15)).foregroundColor(.init(.cyan))
                
                Picker(selection: $selectedSegment, label: Text("")) {
                    Text("Male").tag(0)
                    Text("Female").tag(1)
                }.shadow(color: .init(.cyan), radius: 0).pickerStyle(SegmentedPickerStyle())
                Image(systemName: isFavorite ? "star.fill" : "star").resizable().frame(width: 50, height: 50).foregroundColor(.yellow).shadow(color: isFavorite ? .primary : .secondary, radius: 3).onTapGesture {
                    self.isFavorite.toggle()
                }
            }.padding()
            Spacer()
            Divider()
            Button(action: {
                self.updatePerson()
            }, label: {
                Text("UPDATE PERSON").font(.custom("American typewriter", size: 30)).foregroundColor(.init(.accentColor))
            }).alert(isPresented: self.$isActive) {
                Alert(title: Text("Person \(personToUpdate.firstName!) Updated!"), message: nil, dismissButton: .default(Text("Ok")))
            }
            Divider()
        }.padding().sheet(isPresented: self.$addImage) { ImagePickerView(showImagePicker: self.$addImage, image: self.$image)
        }
    }
}

struct UpdatePersonView_Previews: PreviewProvider {
    static var previews: some View {
        UpdatePersonView(personToUpdate: Person(), isActive: .constant(false))
    }
}
