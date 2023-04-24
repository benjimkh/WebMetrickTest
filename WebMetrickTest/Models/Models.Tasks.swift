//
//  Models.Tasks.swift
//  WebMetrickTest
//
//  Created by Benyamin Mokhtarpur on 4/19/23.
//

import Foundation
import SwiftUI


extension Model {
    struct Task : Identifiable , Equatable {
        
        var id : String = UUID().uuidString
        let name : String
        let taskName : String
        let date : Date
        var status : Status = .notCompleted

    }
    
    
    
    
    enum Status : Int , Identifiable , CaseIterable {
        
        var id : Int { rawValue }
        
        case completed
        case notCompleted
        
        var title : String {
            
            switch self {
            case .completed :
                return "Completed"
            case .notCompleted :
                return "Not Completed"
            }
            
        }
        
        
    }
    
    
}




