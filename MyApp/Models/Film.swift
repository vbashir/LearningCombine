//
//  Film.swift
//  MyApp
//
//  Created by Башир Валиев on 25.03.2022.
//

import Foundation

struct Films: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Film]
}

struct Film: Codable, Identifiable {
    var id = UUID()
    let characters: [String]
    let created: String
    let director: String
    let edited: String
    let episode_id: Int
    let opening_crawl: String
    let planets: [String]
    let producer: String
    let release_date: String
    let species: [String]
    let starships: [String]
    let title: String
    let url: String
    let vehicles: [String]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = UUID()
        self.characters = try container.decode([String].self, forKey: .characters)
        self.created = try container.decode(String.self, forKey: .created)
        self.director = try container.decode(String.self, forKey: .director)
        self.edited = try container.decode(String.self, forKey: .edited)
        self.episode_id = try container.decode(Int.self, forKey: .episode_id)
        self.opening_crawl = try container.decode(String.self, forKey: .opening_crawl)
        self.planets = try container.decode([String].self, forKey: .planets)
        self.producer = try container.decode(String.self, forKey: .producer)
        self.release_date = try container.decode(String.self, forKey: .release_date)
        self.species = try container.decode([String].self, forKey: .species)
        self.starships = try container.decode([String].self, forKey: .starships)
        self.title = try container.decode(String.self, forKey: .title)
        self.url = try container.decode(String.self, forKey: .url)
        self.vehicles = try container.decode([String].self, forKey: .vehicles)
    }
}
