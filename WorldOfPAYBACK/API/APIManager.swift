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
        type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void) {

        guard let url = URL(string: addressURL) else {
            completion(.failure(NetworkingError.invalidUrl))
            return
        }

        let reuqest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: reuqest) { data, response, error in

            if error != nil {
                completion(.failure(NetworkingError.customError(error: error!)))
                return
            }

            guard let response = response as? HTTPURLResponse,
                (200...300) ~= response.statusCode else {
                let statusCode = (response as! HTTPURLResponse).statusCode
                completion(.failure(NetworkingError.invalidStatusCode(statusCode: statusCode)))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkingError.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(NetworkingError.failedToDecode(error: error)))
            }
        }
        dataTask.resume()
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
