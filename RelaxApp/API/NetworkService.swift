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
    
    func request(date: String, completion: @escaping((ResponseStatus<AsteroidInformation?>) -> Void)) {
        let apiPath = config.getUrl() + "start_date=" + date + "&end_date=" + date + "&api_key=" + config.getApiKey()
        guard let url = URL(string: apiPath) else { return }
        let urlReques = URLRequest(url: url)
        
        let dataTast = urlSession.dataTask(with: urlReques) { data, urlResponse, error in
            
            if let _ = error {
                completion(.failure(NetworkError.otherError))
            }
            
            if let urlResponse = urlResponse as? HTTPURLResponse {
                if urlResponse.statusCode >= 400 && urlResponse.statusCode < 500 {
                    if urlResponse.statusCode == 404 {
                        DispatchQueue.main.async {
                            completion(.failure(NetworkError.notFound))
                        }
                    }
                    DispatchQueue.main.async {
                        completion(.failure(NetworkError.badRequest))
                    }
                }
                if urlResponse.statusCode >= 500 {
                    DispatchQueue.main.async {
                        completion(.failure(NetworkError.serverError))
                    }
                }
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    let decodeData = JsonHelper.shared.decode(data: data)
                    completion(.success(decodeData))
                }
            }
        }
        dataTast.resume()
    }
    
}
