//
//  Planet.swift
//  MyApp
//
//  Created by Башир Валиев on 25.03.2022.
//

import Foundation

struct Planets: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Planet]
}

struct Planet: Codable, Identifiable {
    var id = UUID()
    var name: String
    var diameter: String
    var rotation_period: String
    var orbital_period: String
    var gravity: String
    var population: String
    var climate: String
    var terrain: String
    var surface_water: String
    var residents: [String]
    var films: [String]
    var url: String
    var created: String
    var edited: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = UUID()
        self.name = try container.decode(String.self, forKey: .name)
        self.diameter = try container.decode(String.self, forKey: .diameter)
        self.rotation_period = try container.decode(String.self, forKey: .rotation_period)
        self.orbital_period = try container.decode(String.self, forKey: .orbital_period)
        self.gravity = try container.decode(String.self, forKey: .gravity)
        self.population = try container.decode(String.self, forKey: .population)
        self.climate = try container.decode(String.self, forKey: .climate)
        self.terrain = try container.decode(String.self, forKey: .terrain)
        self.surface_water = try container.decode(String.self, forKey: .surface_water)
        self.residents = try container.decode([String].self, forKey: .residents)
        self.films = try container.decode([String].self, forKey: .films)
        self.url = try container.decode(String.self, forKey: .url)
        self.created = try container.decode(String.self, forKey: .created)
        self.edited = try container.decode(String.self, forKey: .edited)
    }
}
