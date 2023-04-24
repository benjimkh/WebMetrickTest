//
//  NavItemsView.swift
//  WebMetrickTest
//
//  Created by Benyamin Mokhtarpur on 4/19/23.
//

import Foundation
import SwiftUI

struct Modifier : ViewModifier {
    
    @ObservedObject var taskVM : ViewModel.Task
    
    func body(content : Content) -> some View {
        
        content
            .navigationBarTitle("To DO")
            .navigationBarItems(trailing: HStack(spacing:30){
                EditButton()
                    .disabled(taskVM.tasks.isEmpty)
                Button(
                    action : { taskVM.isPresented.toggle()},
                    label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    })
            })
            .onChange(of: taskVM.status, perform: { _ in
                guard !taskVM.tasks.isEmpty else { return }
                withAnimation() {taskVM.filter()}
            })
            .fullScreenCover(isPresented: $taskVM.isPresented, content: {
                taskDetailsView(taskVM: taskVM)
            })
    }
    
}
