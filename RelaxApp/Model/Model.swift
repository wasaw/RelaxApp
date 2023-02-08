//
//  Entity.swift
//  RelaxApp
//
//  Created by Александр Меренков on 17.12.2022.
//

import Foundation

//  MARK: - Codable

struct AsteroidInformation: Codable {
    let element_count: Int
    let near_earth_objects: [String: [AsteridStruct]]
}

struct AsteridStruct: Codable {
    let id: String
    let name: String
    let close_approach_data: [ApproachData]
}

struct ApproachData: Codable {
    let relative_velocity: RevativeVelocity
    let miss_distance: MissDistance
}

struct RevativeVelocity: Codable {
    let kilometers_per_second: String
}

struct MissDistance: Codable {
    let kilometers: String
}

//  MARK: - Main

struct Asteroid {
    let id: String
    let name: String
    let speed: String
    let distance: Double
    var user: Credentials? = nil
}

struct Credentials {
    let nickname: String
    let describe: String
    let start: Double?
}

//  MARK: - Error

enum ResponseStatus<T> {
    case success(T)
    case failure(Error)
}

enum NetworkError: Error {
    case notFound
    case badRequest
    case serverError
    case otherError
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFound:
            return NSLocalizedString("Страница не найдена.", comment: "")
        case .badRequest:
            return NSLocalizedString("Неправильный запрос.", comment: "")
        case .serverError:
            return NSLocalizedString("Сервер временно недоступен. Попробуйте позже.", comment: "")
        case .otherError:
            return NSLocalizedString("Ошибка. Попробуйте снова.", comment: "")
        }
    }
}

enum CoreDataError: Error {
    case somethingError
}

extension CoreDataError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .somethingError:
            return NSLocalizedString("Ошибка. Попробуйте снова.", comment: "")
        }
    }
}
