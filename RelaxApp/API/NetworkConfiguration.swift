//
//  NetworkConfiguration.swift
//  RelaxApp
//
//  Created by Александр Меренков on 17.12.2022.
//

import Foundation

struct NetworkConfiguration {
    
//    MARK: - Properties
    
    private let apiUrl = "https://api.nasa.gov/neo/rest/v1/feed?"
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? ""

//    MARK: - Helpers
    
    func getUrl() -> String {
        return apiUrl
    }
    
    func getApiKey() -> String {
        return apiKey
    }
}
