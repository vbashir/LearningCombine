//
//  Specie.swift
//  MyApp
//
//  Created by Башир Валиев on 25.03.2022.
//

import Foundation

struct Species: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Specie]
}

struct Specie: Codable, Identifiable {
    var id = UUID()
    let average_height: String
    let average_lifespan: String
    let classification: String
    let created: String
    let designation: String
    let edited: String
    let eye_colors: String
    let hair_colors: String
    let homeworld: String
    let language: String
    let name: String
    let people: [String]
    let films: [String]
    let skin_colors: String
    let url: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = UUID()
        self.average_height = try container.decode(String.self, forKey: .average_height)
        self.average_lifespan = try container.decode(String.self, forKey: .average_lifespan)
        self.classification = try container.decode(String.self, forKey: .classification)
        self.created = try container.decode(String.self, forKey: .created)
        self.designation = try container.decode(String.self, forKey: .designation)
        self.edited = try container.decode(String.self, forKey: .edited)
        self.eye_colors = try container.decode(String.self, forKey: .eye_colors)
        self.hair_colors = try container.decode(String.self, forKey: .hair_colors)
        self.homeworld = try container.decode(String.self, forKey: .homeworld)
        self.language = try container.decode(String.self, forKey: .language)
        self.name = try container.decode(String.self, forKey: .name)
        self.people = try container.decode([String].self, forKey: .people)
        self.films = try container.decode([String].self, forKey: .films)
        self.skin_colors = try container.decode(String.self, forKey: .skin_colors)
        self.url = try container.decode(String.self, forKey: .url)
    }
}
