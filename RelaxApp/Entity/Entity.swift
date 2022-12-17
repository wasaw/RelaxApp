//
//  Entity.swift
//  RelaxApp
//
//  Created by Александр Меренков on 17.12.2022.
//

struct AsteroidInformation: Codable {
    let element_count: Int
    let near_earth_objects: [String: [AsteridStruct]]
}

struct AsteridStruct: Codable {
    let id: String
    let name: String
    let is_potentially_hazardous_asteroid: Bool
    let close_approach_data: [ApproachData]
}

struct ApproachData: Codable {
    let relative_velocity: RevativeVelocity
}

struct RevativeVelocity: Codable {
    let kilometers_per_hour: String
}