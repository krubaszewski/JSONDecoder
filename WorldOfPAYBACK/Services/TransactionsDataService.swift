//
//  TransactionsDataService.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 21/02/2023.
//

import Foundation
import Combine

class TransactionsDataService {

    @Published var transactions: [Item] = []

    var res: AnyCancellable?

    init() {
        fetchFromFile()
    }

    //        func fetchFromFile() {
    //            do {
    //                let res = try StaticJSONMapper.decode(file: "PBTransactions", type: Transactions.self)
    //                transactions = res.items
    //            } catch {
    //                print(error)
    //            }
    //        }

    func fetchFromFile() {
        res = Bundle.main.decodeable(fileName: "PBTransactions.json")
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }, receiveValue: { (fact: Transactions) in
                self.transactions = fact.items
                self.res?.cancel()
            })
    }

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


