//
//  ViewModel.Task.swift
//  WebMetrickTest
//
//  Created by Benyamin Mokhtarpur on 4/19/23.
//

import Foundation

extension ViewModel {
    
    class Task : Identifiable , ObservableObject {
        
        var tasks : [Model.Task] = [
            Model.Task(name: "Task 1", taskName: "Medium", date: Date(timeIntervalSinceReferenceDate:1619231231.0)),
            Model.Task(name: "Task 2", taskName: "Binstant", date: Date(timeIntervalSinceReferenceDate:1621231231.0)),
            Model.Task(name: "Task 3", taskName: "App Store", date: Date()),
            Model.Task(name: "Task 4", taskName: "Garden", date: Date(), status: .completed)
        ]
        @Published var filteredTasks : [Model.Task] = []
        
        @Published var status : Model.Status = .completed
        @Published var isPresented = false
        @Published var searched = ""
        init() {
            filter()
        }
        func addTask(task : Model.Task){
            tasks.append(task)
            filter()

        }
        
        func moveTask(from source: IndexSet, to destination: Int) {
            tasks.move(fromOffsets: source, toOffset: destination)
            filter()
        }
        
        func removeTask(indexAt : IndexSet){
            tasks.remove(atOffsets: indexAt)
            filter()

        }
        
        func changeState(task : Model.Task, state: Model.Status){
            guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }
            tasks[index].status = state
            filter()

        }
        
        func filter() {
            
            switch status {
                
            case .notCompleted :
                filteredTasks = tasks.filter { $0.status == .notCompleted }
            case .completed :
                filteredTasks = tasks.filter { $0.status == .completed }
            }
        }
        
    }
    
}
