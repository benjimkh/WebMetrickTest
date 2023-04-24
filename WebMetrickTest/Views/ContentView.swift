//
//  ContentView.swift
//  WebMetrickTest
//
//  Created by Benyamin Mokhtarpur on 4/19/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var taskVM = ViewModel.Task.init()
    
    var body: some View {
            NavigationView{
                VStack{
                    sortPickerView(taskVM : taskVM)
                    taskListView(taskVM : taskVM)
                }
                .modifier(Modifier(taskVM : taskVM))
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

