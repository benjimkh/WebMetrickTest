//
//  dateView.swift
//  WebMetrickTest
//
//  Created by Benyamin Mokhtarpur on 4/19/23.
//

import Foundation
import SwiftUI


    
struct dateView: View {
    
    var task : Model.Task
    
    var body: some View {
            Text("Date :")
                .font(.caption)
                .foregroundColor(.secondary)
            Text(task.date , style: .date)
        
    }
}


struct dateView_Previews: PreviewProvider {
    static var previews: some View {
        dateView(task: Model.Task(id: "", name: "Name", taskName: "Task Name", date: Date()))
    }
}
