//
//  Bunde-Decoder.swift
//  WorldOfPAYBACK
//
//  Created by Kacper Rubaszewski on 15/02/2023.
//

import Foundation

extension Bundle{
    func decode(_ file: String) -> [String: Item] {
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed to locate \(file) in bundle")
        }
                       
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load the data from: \(file)")
        }
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode([String: Item].self, from: data) else{
            fatalError("Failed to decode the data from: \(file)")
        }
        return loaded
    }
}
