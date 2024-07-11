//
//  TaskView.swift
//  MVVC Pattern Practice
//
//  Created by Trevor Sharnick on 7/11/24.
//

import SwiftUI
/** (VIEW): TaskView: A subview for displaying individual tasks. It uses @ObservedObject to observe changes in the TaskViewModel. */
struct TaskView: View {
    
    let task: Task
    // observes changes in the TaskViewModel
    @ObservedObject var viewModel: TaskViewModel
    
    var body: some View {
        HStack {
            Text(task.title)
            Spacer()
            Button(action: {
                viewModel.toggleTaskCompletion(task: task)
            }) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .green : .gray)
            }
        }
        .padding()
    }
}

/* By setting up the preview this way, you can see how TaskView renders with sample data, making it easier to develop and test your view in isolation. */
#Preview {
    // create a sample task
    let sampleTask = Task(title: "Sample Task", isCompleted: false)
    // Create a TaskViewModel and add the sample task to it
    let viewModel = TaskViewModel()
    viewModel.tasks.append(sampleTask)
    // return the TaskView with thew sample task and view model
    return TaskView(task: sampleTask, viewModel: viewModel)
        .padding()
}
