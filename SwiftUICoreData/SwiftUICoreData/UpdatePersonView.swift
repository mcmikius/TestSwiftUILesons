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
        Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
    }
}

struct UpdatePersonView_Previews: PreviewProvider {
    static var previews: some View {
        UpdatePersonView(personToUpdate: Person(), isActive: .constant(false))
    }
}
