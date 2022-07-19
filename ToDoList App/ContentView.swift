//
//  ContentView.swift
//  ToDoList App
//  Application focuses on the capturing of items via a todo list application with the ability to modify (remove or move) items within the list.
//  Created by Jason Dookarun on 19/07/2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newToDo : String = ""
    
    var searchBar : some View{
        HStack{
            TextField("Enter a new task", text: self.$newToDo)
            Button(action: {
                self.addNewToDo()
            }, label: {Text("Add New").padding()
            })
        }
    }
    
    // addition of items to a list via counter
    func addNewToDo(){
        taskStore.tasks.append(Task(id: String(taskStore.tasks.count + 1), toDoItem: newToDo))
        self.newToDo = ""
    // add auto generated ID for future developments
    }
    var body: some View {
        NavigationView{
            VStack{
                // application of text field for user to enter content
                searchBar.padding()
                List{
                    ForEach(self.taskStore.tasks){
                        task in
                        Text(task.toDoItem)
                    }.onMove(perform: self.move)
                        .onDelete(perform: self.delete)
                }.navigationBarTitle(" To-Do List ✅ ").navigationBarItems(trailing: EditButton())
            }
        }
    }
    
    // movement of items from one location to another
    func move(from source : IndexSet, to destination : Int){
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    // removal of item from list
    func delete(at offsets : IndexSet){
        taskStore.tasks.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
