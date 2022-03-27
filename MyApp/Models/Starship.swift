//
//  Starship.swift
//  MyApp
//
//  Created by Башир Валиев on 25.03.2022.
//

import Foundation

struct Starships: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Starship]
}

struct Starship: Codable, Identifiable {
    var id = UUID()
    let MGLT: String
    let cargo_capacity: String
    let consumables: String
    let cost_in_credits: String
    let created: String
    let crew: String
    let edited: String
    let hyperdrive_rating: String
    let length: String
    let manufacturer: String
    let max_atmosphering_speed: String
    let model: String
    let name: String
    let passengers: String
    let films: [String]
    let pilots: [String]
    let starship_class: String
    let url: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = UUID()
        self.MGLT = try container.decode(String.self, forKey: .MGLT)
        self.cargo_capacity = try container.decode(String.self, forKey: .cargo_capacity)
        self.consumables = try container.decode(String.self, forKey: .consumables)
        self.cost_in_credits = try container.decode(String.self, forKey: .cost_in_credits)
        self.created = try container.decode(String.self, forKey: .created)
        self.crew = try container.decode(String.self, forKey: .crew)
        self.edited = try container.decode(String.self, forKey: .edited)
        self.hyperdrive_rating = try container.decode(String.self, forKey: .hyperdrive_rating)
        self.length = try container.decode(String.self, forKey: .length)
        self.manufacturer = try container.decode(String.self, forKey: .manufacturer)
        self.max_atmosphering_speed = try container.decode(String.self, forKey: .max_atmosphering_speed)
        self.model = try container.decode(String.self, forKey: .model)
        self.name = try container.decode(String.self, forKey: .name)
        self.passengers = try container.decode(String.self, forKey: .passengers)
        self.films = try container.decode([String].self, forKey: .films)
        self.pilots = try container.decode([String].self, forKey: .pilots)
        self.starship_class = try container.decode(String.self, forKey: .starship_class)
        self.url = try container.decode(String.self, forKey: .url)
    }
}
