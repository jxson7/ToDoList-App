//  ContentView.swift
//  ToDoList App
//  Application focuses on the capturing of items via a todo list application with the ability to modify (remove or move) items within the list.
//  Created by Jason Dookarun on 19/07/2022.

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
    
    func addNewToDo(){
        taskStore.tasks.append(Task(id: String(taskStore.tasks.count + 1), toDoItem: newToDo))
        self.newToDo = ""
    }
    var body: some View {
        NavigationView{
            VStack{
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
    
    func move(from source : IndexSet, to destination : Int){
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets : IndexSet){
        taskStore.tasks.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

