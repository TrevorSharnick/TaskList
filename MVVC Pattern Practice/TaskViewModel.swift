//
//  TaskViewModel.swift
//  MVVC Pattern Practice
//
//  Created by Trevor Sharnick on 7/11/24.
//

import Foundation
import SwiftUI

/** (VIEW-MODEL): Manages the state and business logic 
 TaskViewModel class is an observable object managing a list of tasks. It includes methods to add a new task and toggle the completion status of a task. The @Published property wrapper ensures that changes to the tasks array trigger UI updates.
 */
class TaskViewModel: ObservableObject {
    // creates a @Published array of Task objects that will be observable within multiple views of this app.
    @Published var tasks: [Task] = []
    
    /** creates a new 'Task' with the provided title and adds it into the 'tasks' array (the variable marked @Published which other views watch for and update as the array changes. */
    func addTask(title: String) {
        let newTask = Task(title: title)
        tasks.append(newTask)
    }
    
    /** Toggles the completion status of a given task If it finds the task in the 'tasks' array by its unique 'id'. If it does, it toggles it's 'isCompleted' property to be true. */
    func toggleTaskCompletion(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
        
    }
}
