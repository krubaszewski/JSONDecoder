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
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: data)
    }
}

extension StaticJSONMapper {
    enum MappingError: Error {
        case failedToGetContents
    }
}

//extension DateFormatter{
//    static let iso8601Full: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd.MM.yyyy"
//
//        return formatter
//    }()
//
//    static let testtest: DateFormatter = {
//        let cos = DateFormatter()
//        cos.locale = Locale(identifier: "de_DE")
//        cos.dateStyle = .short
//        let tt = cos.string(from: iso8601Full)
//        return tt
//    }()
//}
