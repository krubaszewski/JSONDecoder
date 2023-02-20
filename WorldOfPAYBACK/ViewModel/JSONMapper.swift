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

