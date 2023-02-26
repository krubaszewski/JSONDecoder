//
//  FilterOption.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 22/02/2023.
//

import Foundation

enum FilterOption:String{
    
    static var allFilters: [FilterOption] {
        return [.All, .ONE, .TWO, .THREE]
    }
    case All = "All"
    case ONE = "1"
    case TWO = "2"
    case THREE = "3"
}
