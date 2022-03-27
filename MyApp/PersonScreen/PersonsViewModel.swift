//
//  PersonsViewModel.swift
//  MyApp
//
//  Created by Башир Валиев on 25.03.2022.
//

import Foundation
import Combine

class PersonsViewModel: ObservableObject {
    
    @Published var persons: Peoples?
    @Published var isLoad: Bool = false
    @Published var search: String = "" {
        didSet {
            getPersons()
        }
    }
    var page: Int = 1 {
        didSet {
            getPersons()
        }
    }
    
    var subscriptions: Set<AnyCancellable> = []
    
    public init() {
        self.getPersons()
    }
    
    func nextPage() {
        self.page += 1
    }

    func previousPage() {
        if self.page > 1 {
            self.page -= 1
        }
    }
    
    func getPersons() {
        self.isLoad = true
        let publisher = Api.shared.fetch(category: .peoples, search: search, page: self.page)
        
        publisher
            .decode(type: Peoples.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch(completion) {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    self.isLoad = false
                }
            } receiveValue: { peoples in
                self.persons = peoples
            }
            .store(in: &subscriptions)
    }
}
