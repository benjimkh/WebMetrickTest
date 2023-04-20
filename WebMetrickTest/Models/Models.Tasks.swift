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
        let priority : Priority
        var status : Status = .notCompleted

    }
    
    
    enum Priority : Int , Identifiable , CaseIterable {
        
        var id : Int { rawValue }
        
        case low
        case normal
        case medium
        case high
        
        var title : String {
            
            switch self {
            case .low :
                return "Low"
            case .normal :
                return "Normal"
            case .medium :
                return "Medium"
            case .high :
                return "High"
            }
            
        }
        
        var color : Color {
            
            switch self {
            case .low:
                return .white
            case .normal:
                return .blue
            case .medium:
                return .orange
            case .high :
                return .red
            }
        }
        
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
    
    enum SortType : String , Identifiable , CaseIterable {
        
        var id : String { rawValue }
        
        case alphabetical
        case date
        case priority
        
    }
    
}




