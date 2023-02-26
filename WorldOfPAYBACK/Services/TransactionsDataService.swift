//
//  TransactionsDataService.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 21/02/2023.
//

import Foundation
import Combine

class TransactionsDataService: ObservableObject {

    @Published var transactions: [Item] = []
    @Published var error: StaticJSONMapper.MappingError?
    @Published var hasError: Bool = false

    var jsonFileSubscription: AnyCancellable?

    init() {
        fetchFromFile()
    }

            func fetchFromFile() {
                do {
                    let jsonFileSubscription = try StaticJSONMapper.decode(file: "PBTransactions", type: Transactions.self)
                    transactions = jsonFileSubscription.items
                } catch {
                    print(error)
                    self.hasError = true
                    self.error = error as? StaticJSONMapper.MappingError
                }
            }

//    func fetchFromFile() {
//        jsonFileSubscription = Bundle.main.decodeable(fileName: "PBTransacons.json")
//            .sink(receiveCompletion: { completion in
//            switch completion {
//            case .finished:
//                break
//            case .failure(let error):
//                print("Error: \(error.localizedDescription)")
//            }
//        }, receiveValue: { [weak self] (fact: Transactions) in
//                self?.transactions = fact.items
//                self?.jsonFileSubscription?.cancel()
//            })
//    }

}

extension Bundle {

    func readFile(file: String) -> AnyPublisher<Data, Error> {
        self.url(forResource: file, withExtension: nil)
            .publisher
            .tryMap { string in
            guard let data = try? Data(contentsOf: string) else {
                fatalError("Failed to load \(file) from bundle.")
            }
            return data
        }
            .mapError { error in
            return error
        }.eraseToAnyPublisher()
    }

    func decodeable<T: Decodable>(fileName: String) -> AnyPublisher<T, Error> {

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return readFile(file: fileName)
            .decode(type: T.self, decoder: decoder)
            .mapError { error in
            return error
        }
            .eraseToAnyPublisher()
    }
}


