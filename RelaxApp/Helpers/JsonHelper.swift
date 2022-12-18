//
//  JsonHelper.swift
//  RelaxApp
//
//  Created by Александр Меренков on 17.12.2022.
//

import Foundation

struct JsonHelper {
    static let shared = JsonHelper()
    
//    MARK: - Properties
    private let jsonDecoder = JSONDecoder()
    
//    MARK: - Helpers
    func decode(data: Data) -> AsteroidInformation? {
        return try? jsonDecoder.decode(AsteroidInformation.self, from: data)
    }
}
