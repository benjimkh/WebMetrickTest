//
//  taskListView.swift
//  WebMetrickTest
//
//  Created by Benyamin Mokhtarpur on 4/19/23.
//

import Foundation
import SwiftUI

struct taskListView: View {
    
    @ObservedObject var taskVM : ViewModel.Task
    
    var body: some View {
        List {
            ForEach (taskVM.filteredTasks){ task in
                taskView(task: task)
                    .swipeActions {
                        Button(task.status == .notCompleted ? "Complete" :"In Progress") {
                            if task.status == .notCompleted {
                                taskVM.changeState(task: task, state: .completed)
                                
                            } else {
                                taskVM.changeState(task: task, state: .notCompleted)
                                
                            }
                        }.tint(task.status == .notCompleted ? .green : .red)
                        
                        
                    }
            }
            .onMove(perform: taskVM.moveTask(from:to:))
            .onDelete(perform: {
                taskVM.removeTask(indexAt: $0)
            })
        }.listStyle(InsetListStyle())
    }
}

struct taskListView_Previews: PreviewProvider {
    static var previews: some View {
        taskListView(taskVM: ViewModel.Task())
    }
}

