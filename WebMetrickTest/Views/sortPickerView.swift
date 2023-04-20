//
//  sortPickerView.swift
//  WebMetrickTest
//
//  Created by Benyamin Mokhtarpur on 4/19/23.
//

import Foundation
import SwiftUI

struct sortPickerView: View {
    
    @ObservedObject var taskVM : ViewModel.Task
    
    var body: some View {
        Picker("", selection: $taskVM.status) {
            ForEach(Model.Status.allCases){
                Text($0.title.capitalized)
                    .tag($0)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}

struct sortPickerView_Previews: PreviewProvider {
    static var previews: some View {
        sortPickerView(taskVM: ViewModel.Task())
    }
}
