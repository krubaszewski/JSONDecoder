//
//  StaticJSONMapper.swift
//  UserFriends
//
//  Created by Kacper Rubaszewski on 02/11/2022.
//

import Foundation

struct StaticJSONMapper {
    static func decode<T: Decodable>(file: String, type: T.Type) throws -> T {
        
        guard
            !file.isEmpty,
            let path = Bundle.main.path(forResource: file, ofType: "json"),
            let data = FileManager.default.contents(atPath: path)
        else {
            throw MappingError.failedToGetContents
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//        decoder.dateDecodingStrategy = .iso8601
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        return try decoder.decode(T.self, from: data)
    }
}

extension StaticJSONMapper {
    enum MappingError: Error {
        case failedToGetContents
    }
}


//extension Formatter{
//    static let date = DateFormatter()
//}
//extension Date{
//        var iso8601CustomDate: String{
//            Formatter.date.calendar = Calendar(identifier: .iso8601)
//            Formatter.date.locale = Locale(identifier: "en_US_POSIX")
//            Formatter.date.timeZone = .current
//            Formatter.date.dateFormat = "dd.MM.yyyy"
//
//            return Formatter.date.string(from: self)
//    }

extension DateFormatter{
    static let isoCustom: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        return formatter
    }()
}
//    static let testtest: DateFormatter = {
//        let cos = DateFormatter()
//        cos.locale = Locale(identifier: "de_DE")
//        cos.dateStyle = .short
//        let tt = cos.string(from: iso8601Full)
//        return tt
//    }()

