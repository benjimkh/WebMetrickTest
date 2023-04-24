//
//  taskView.swift
//  WebMetrickTest
//
//  Created by Benyamin Mokhtarpur on 4/19/23.
//

import Foundation
import SwiftUI


struct taskView: View {
    
    var task : Model.Task
    
    var body: some View {
        VStack (alignment : .leading){
            HStack{
                nameView(task: task)
                Spacer()
                dateView(task: task)
            }
            Text("Task :")
                .font(.caption)
                .foregroundColor(.secondary)
            Text(task.taskName)
                .font(.system(size: 15, weight: .bold))
                .italic()
        }
        .padding(10)
        .background(
            task.priority.color.opacity(0.2))
        .background(
            RoundedRectangle(cornerRadius: 10 , style: .continuous)
                .stroke(task.priority.color , lineWidth: 0.7)
                .shadow(color: task.priority.color, radius: 0.7))
    }
}

struct taskView_Previews: PreviewProvider {
    static var previews: some View {
        taskView(task: Model.Task(id: "", name: "Name", taskName: "Task Name", date: Date(), priority: .normal))
    }
}
