//
//  TaskListView.swift
//  MVVC Pattern Practice
//
//  Created by Trevor Sharnick on 7/11/24.
//

import SwiftUI
/** (VIEW): TaskListView: The main view that displays a list of tasks and an input field to add new tasks. It uses @StateObject to create and manage the TaskViewModel. */
struct TaskListView: View {
    // Creates and manages the state of the TaskViewModel()
    @StateObject private var viewModel = TaskViewModel()
    @State private var newTaskTitle: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter new task", text: $newTaskTitle, onCommit: {
                    viewModel.addTask(title: newTaskTitle)
                    newTaskTitle = ""
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                List {
                    ForEach(viewModel.tasks) {
                        task in
                        TaskView(task: task, viewModel: viewModel)
                    }
                    .onDelete(perform: viewModel.removeTask)
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    TaskListView()
}
