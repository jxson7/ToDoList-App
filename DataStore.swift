//
//  DataStore.swift
//  ToDoList App
//
//  Created by Jason Dookarun on 19/07/2022.
//

import Foundation
import SwiftUI
import Combine

struct Task : Identifiable{
    var ID = String()
    var toDoItem = String()
    
    
    // Add more complications
    
    
}


class TaskStore  : ObservableObject{
    
    @Published var tasks = [Task]()
}
