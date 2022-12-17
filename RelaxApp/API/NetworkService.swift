//
//  NetworkService.swift
//  RelaxApp
//
//  Created by Александр Меренков on 17.12.2022.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()
    
//    MARK: - Properties
    private let config = NetworkConfiguration()
    private let configuration = URLSessionConfiguration.default
    private lazy var urlSession: URLSession = {
        let urlSession = URLSession(configuration: configuration)
        return urlSession
    }()
    
//    MARK: - Helpers
    
    func request() {
        let apiPath = config.getUrl() + config.getApiKey()
        guard let url = URL(string: apiPath) else { return }
        let urlReques = URLRequest(url: url)
        
        let dataTast = urlSession.dataTask(with: urlReques) { data, urlResponse, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    let decodeData = JsonHelper.shared.decode(data: data)
                }
            }
        }
        dataTast.resume()
    }
    
}