//
//  ContentView.swift
//  MyApp
//
//  Created by Башир Валиев on 25.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var itemSelect: Int = 0
    
    var body: some View {
        TabView(selection: $itemSelect) {
            Persons().tabItem {
                Image(systemName: "person.3")
                Text("peoples")
            }.tag(0)
            Text("Планеты").tabItem {
                Image(systemName: "circlebadge.2.fill")
                Text("planets")
            }.tag(1)
            Text("starships").tabItem {
                Image(systemName: "airplane")
                Text("starships")
            }.tag(2)
            Text("species").tabItem {
                Image(systemName: "pawprint.fill")
                Text("species")
            }.tag(3)
            Text("vehicles").tabItem {
                Image(systemName: "car.fill")
                Text("vehicles")
            }.tag(4)
            Text("films").tabItem {
                Image(systemName: "film")
                Text("films")
            }.tag(5)
        }.font(.headline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
