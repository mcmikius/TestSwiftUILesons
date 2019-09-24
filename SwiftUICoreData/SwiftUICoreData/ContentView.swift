//
//  ContentView.swift
//  SwiftUICoreData
//
//  Created by Mykhailo Bondarenko on 24.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Person.fetchRequest()) var persons: FetchedResults<Person>
    
    @State private var isActive = false
    @State private var addImage = false
    @State private var addPerson = false
    @State private var image: UIImage?
    @State private var isFavorite = false
    @State private var selectedSegment = 0
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var age = ""
    
    fileprivate func displayPersons() -> some View {
        return ForEach(persons, id: \.id) { person in
            NavigationLink(destination: UpdatePersonView(personToUpdate: person, isActive: self.$isActive)) {
                VStack {
                    PersonCellView(image: Image(uiImage: UIImage(data: person.photoData!) ?? UIImage(systemName: "person")!), favoriteImage: Image(systemName: person.isFavorite ? "star.fill" : "star"), gender: person.gender ?? "...", age: person.age ?? "...", firstName: person.firstName ?? "...", lastName: person.lastName ?? "...")
                    Text(self.isActive ? "" : "")
                }
            }
        }.onDelete { IndexSet in
            guard 0 < self.persons.count else { return }
            self.managedObjectContext.delete(self.persons[IndexSet.first!])
            do {
                try self.managedObjectContext.save()
            } catch {
                print(error, error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center, spacing: 25.0) {
                    Text("Add new person").font(.headline)
                    Button(action: {
                        self.addPerson.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill").foregroundColor(.green).imageScale(.large)
                    })
                }
                List {
                    displayPersons()
                }
            }.sheet(isPresented: self.$addPerson, onDismiss: {
                guard !self.firstName.isEmpty, !self.lastName.isEmpty, !self.age.isEmpty else { return }
                let personManagedObjectContext = Person(context: self.managedObjectContext)
                personManagedObjectContext.firstName = self.firstName
                personManagedObjectContext.lastName = self.lastName
                personManagedObjectContext.age = self.age
                
                if self.selectedSegment == 0 {
                    personManagedObjectContext.gender = "male"
                } else {
                    personManagedObjectContext.gender = "female"
                }
                
                personManagedObjectContext.isFavorite = self.isFavorite
                
                if let imageToData = self.image?.toJpegCompressedData {
                    personManagedObjectContext.photoData = imageToData
                }
                
                do {
                    try self.managedObjectContext.save()
                } catch {
                    print(error, error.localizedDescription)
                }
                
                self.isFavorite = false
                self.firstName = ""
                self.lastName = ""
                self.age = ""
                self.image = UIImage(systemName: "plus.circle")
                
            }) {
                AddNewPersonView(image: self.$image, firstName: self.$firstName, lastName: self.$lastName, age: self.$age, segmentedControl: self.$selectedSegment, isFavorite: self.$isFavorite)
                }.navigationBarTitle(Text("Persons")).navigationBarItems(trailing: EditButton())
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
