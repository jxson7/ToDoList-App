//
//  ContentView.swift
//  ToDoList App
//
//  Created by Jason Dookarun on 19/07/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    
    var body: some View {
        NavigationView{
            VStack{
                List(self.taskStore.tasks){ task in
                    Text(task.toDoItem)
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
