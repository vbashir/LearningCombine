//
//  Person.swift
//  MyApp
//
//  Created by Башир Валиев on 28.03.2022.
//

import SwiftUI

struct Person: View {
    
    var person: People
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Group {
                PersonField(title: "Пол", value: person.gender)
                PersonField(title: "Дата рождения", value: person.birth_year)
                PersonField(title: "Вес", value: person.mass)
            }
            Group {
                PersonField(title: "Цвет волос", value: person.hair_color)
                PersonField(title: "Цвет кожи", value: person.skin_color)
                PersonField(title: "Родной мир", value: person.homeworld)
            }
            Spacer()
        }
        .navigationTitle(person.name)
    }
}

struct PersonField: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.subheadline)
            Text(value).font(.title)
        }
    }
}

//struct Person_Previews: PreviewProvider {
//    static var previews: some View {
//        Person()
//    }
//}
