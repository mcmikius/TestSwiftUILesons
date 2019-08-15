//
//  ContentView.swift
//  CoreDataTodo
//
//  Created by Mykhailo Bondarenko on 8/15/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext)
    var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems())
    var toDoItems:FetchedResults<ToDoItem>
    @State private var newToDoItem = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Whats next?")) {
                    HStack {
                        TextField("New item", text: self.$newToDoItem)
                        Button(action: {
                            let toDoItem = ToDoItem(context: self.managedObjectContext)
                            toDoItem.title = self.newToDoItem
                            toDoItem.createdAt = Date()
                            do {
                                try self.managedObjectContext.save()
                            } catch {
                                print(error)
                            }
                            self.newToDoItem = ""
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                Section(header: Text("To Do's")) {
                    ForEach(self.toDoItems) {todoItem in
                        ToDoItemView(title: todoItem.title!, createdAt: "\(todoItem.createdAt!)")
                    }.onDelete { (indexSet) in
                        let deleItem = self.toDoItems[indexSet.first!]
                        self.managedObjectContext.delete(deleItem)
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("My List"))
            .navigationBarItems(trailing: EditButton())
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
