//
//  DateModel.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 16/02/2023.
//

import Foundation

func convertDateFormater(_ date: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"

    guard let date = formatter.date(from: date) else {
        assert(false, "no date from string")
        return ""
    }

    let cos = DateFormatter()
    cos.locale = Locale(identifier: "de_DE")
    cos.dateStyle = .medium
    let timeStamp = cos.string(from: date)

    return timeStamp
}

struct MyDateFormatt{
    func dateFormat(_ date: Date) -> String {
        Formatter.formatter.locale = Locale(identifier: "de_DE")
        Formatter.formatter.dateStyle = .medium
        let timeStamp = Formatter.formatter.string(from: date)
        return timeStamp
    }
}
