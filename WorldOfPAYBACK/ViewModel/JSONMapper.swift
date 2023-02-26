//
//  StaticJSONMapper.swift
//  UserFriends
//
//  Created by Kacper Rubaszewski on 02/11/2022.
//

import Foundation
import Combine

struct StaticJSONMapper {
    static func decode<T: Decodable>(file: String, type: T.Type) throws -> T {

        guard
        !file.isEmpty,
            let path = Bundle.main.path(forResource: file, ofType: "json"),
            let data = FileManager.default.contents(atPath: path) else {
            throw MappingError.failedToGetContents
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
//        Formatter.formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//        decoder.dateDecodingStrategy = .formatted(decoder)
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            throw MappingError.failedToDecodeTheFile
        }
        return loaded
    }
}

extension StaticJSONMapper {
    enum MappingError: LocalizedError {
        case failedToGetContents
        case failedToDecodeTheFile
    }
}

extension StaticJSONMapper.MappingError {

    var errorDescription: String? {
        switch self {
        case .failedToGetContents:
            return "There was a problem with the file!"
        case .failedToDecodeTheFile:
            return "Filed to decode the data!"
        }
    }
}

