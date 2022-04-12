//
//  People.swift
//  MyApp
//
//  Created by Башир Валиев on 25.03.2022.
//

import Foundation

struct Peoples: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [People]
}

struct People: Codable, Identifiable {
    let id: UUID
    let birth_year: String
    let eye_color: String
    let films: [String]
    let gender: String
    let hair_color: String
    let height: String
    let homeworld: String
    let mass: String
    let name: String
    let skin_color: String
    let created: String
    let edited: String
    let species: [String]
    let starships: [String]
    let url: String
    let vehicles: [String]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = UUID()
        self.birth_year = try container.decode(String.self, forKey: .birth_year)
        self.eye_color = try container.decode(String.self, forKey: .eye_color)
        self.films = try container.decode([String].self, forKey: .films)
        self.gender = try container.decode(String.self, forKey: .gender)
        self.hair_color = try container.decode(String.self, forKey: .hair_color)
        self.height = try container.decode(String.self, forKey: .height)
        self.homeworld = try container.decode(String.self, forKey: .homeworld)
        self.mass = try container.decode(String.self, forKey: .mass)
        self.name = try container.decode(String.self, forKey: .name)
        self.skin_color = try container.decode(String.self, forKey: .skin_color)
        self.created = try container.decode(String.self, forKey: .created)
        self.edited = try container.decode(String.self, forKey: .edited)
        self.species = try container.decode([String].self, forKey: .species)
        self.starships = try container.decode([String].self, forKey: .starships)
        self.url = try container.decode(String.self, forKey: .url)
        self.vehicles = try container.decode([String].self, forKey: .vehicles)
    }
    
    public init(
        birth_year: String,
        eye_color: String,
        films: [String],
        gender: String,
        hair_color: String,
        height: String,
        homeworld: String,
        mass: String,
        name: String,
        skin_color: String,
        created: String,
        edited: String,
        species: [String],
        starships: [String],
        url: String,
        vehicles: [String]
    ) {
        self.id = UUID()
        self.birth_year = birth_year
        self.eye_color = eye_color
        self.films = films
        self.gender = gender
        self.hair_color = hair_color
        self.height = height
        self.homeworld = homeworld
        self.mass = mass
        self.name = name
        self.skin_color = skin_color
        self.created = created
        self.edited = edited
        self.species = species
        self.starships = starships
        self.url = url
        self.vehicles = vehicles
    }
}
