//
//  Entity.swift
//  RelaxApp
//
//  Created by Александр Меренков on 17.12.2022.
//

import Foundation

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
