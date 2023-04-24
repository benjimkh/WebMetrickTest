//
//  nameView.swift
//  WebMetrickTest
//
//  Created by Benyamin Mokhtarpur on 4/19/23.
//

import Foundation
import SwiftUI


    
struct nameView: View {
    
    var task : Model.Task
    
    var body: some View {
        HStack{
            VStack(alignment:.leading) {
                Text("Name :")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(task.name)
                    .font(.system(size: 20, weight: .bold))
            }
        }
    }
}


struct nameView_Previews: PreviewProvider {
    static var previews: some View {
        nameView(task: Model.Task(id: "", name: "Name", taskName: "Task Name", date: Date()))
    }
}
