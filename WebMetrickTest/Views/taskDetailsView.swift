//
//  taskDetailsView.swift
//  WebMetrickTest
//
//  Created by Benyamin Mokhtarpur on 4/19/23.
//

import Foundation
import SwiftUI

struct taskDetailsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var taskVM : ViewModel.Task
    
    @State var name = ""
    @State var taskName = ""
    @State var date = Date()
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Task")) {
                    TextField("Name ", text : $name)
                    TextField("Task Name ", text : $taskName)
                }
                
                
                DisclosureGroup("Date") {
                    DatePicker("", selection: $date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
                
            }
            .navigationBarTitle("Add", displayMode: .inline)
            .navigationBarItems(
                                leading: Button(action:{
                                                presentationMode.wrappedValue.dismiss() },
                                                label : {
                                                    Text("Cancel")
                                                    .foregroundColor(.red)
                                                }),
                                trailing: Button(action:{taskVM.addTask(task: .init(name: name, taskName: taskName, date: date))
                                                    presentationMode.wrappedValue.dismiss()},
                                                   label:{
                                                    Text("Save")
                                                   }).disabled(name.isEmpty || taskName.isEmpty)
            )
        }
    }
}

struct taskDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        taskDetailsView(taskVM: ViewModel.Task())
    }
}
