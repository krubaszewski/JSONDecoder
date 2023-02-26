//
//  Date.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 20/02/2023.
//

import Foundation


extension Date{
    
    /// Converts date in formt: iso8601 to format: dd.MM.yyyy
    /// ```
    /// Convert 2022-12-24 09:59:05 +0000 to 24.12.2022
    /// Convert 2022-02-04 08:59:05 +0000 to 04.02.2022
    /// Convert 2022-01-22 08:59:05 +0000 to 22.01.2022
    /// ```
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "de_DE")
        formatter.dateStyle = .medium
        return formatter
    }
    
    /// Converts date in formt: iso8601 to String in format: dd.MM.yyyy
    /// ```
    /// Convert 2022-12-24 09:59:05 +0000 to "24.12.2022"
    /// Convert 2022-02-04 08:59:05 +0000 to "04.02.2022"
    /// Convert 2022-01-22 08:59:05 +0000 to "22.01.2022"
    /// ```
    func customDateFormat() -> String{
        return dateFormatter.string(from: self)
    }
}
