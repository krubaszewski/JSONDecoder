//
//  APIManager.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 26/02/2023.
//

import Foundation

final class APIManager {

    static let shared = APIManager()

    private init() { }

    func urlRequest<T: Decodable>(_ addressURL: String,
        type: T.Type) async throws -> T{

        guard let url = URL(string: addressURL) else {
           throw NetworkingError.invalidUrl
        }

        let request = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse,
            (200...300) ~= response.statusCode else {
            let statusCode = (response as! HTTPURLResponse).statusCode
            throw NetworkingError.invalidStatusCode(statusCode: statusCode)
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let result = try decoder.decode(T.self, from: data)
        
        return result
    }
}

extension APIManager {
    enum NetworkingError: Error {
        case invalidUrl
        case customError(error: Error)
        case invalidStatusCode(statusCode: Int)
        case invalidData
        case failedToDecode(error: Error)
    }
}
