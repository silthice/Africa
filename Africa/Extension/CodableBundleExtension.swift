//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Giap on 12/01/2023.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [CoverImage] {
        //1. Locate JSON file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        //2. Create property for data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in bundle")
        }
        //3. Create decoder
        let decoder = JSONDecoder()
        //4. Create property for decoded data
        guard let loaded = try? decoder.decode([CoverImage].self, from: data) else {
            fatalError("Failed to decode \(file) in bundle")
        }
        //5. Return ready data
        return loaded
    }
}
