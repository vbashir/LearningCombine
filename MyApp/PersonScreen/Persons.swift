//
//  Persons.swift
//  MyApp
//
//  Created by Башир Валиев on 25.03.2022.
//

import SwiftUI

struct Persons: View {
    
    @StateObject var viewModel = PersonsViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                TextField("search", text: $viewModel.search)
                    .textFieldStyle(.roundedBorder)
                HStack {
                    Text(String.localizedStringWithFormat(NSLocalizedString("find peoples", comment: ""), viewModel.persons?.count ?? 0))
                        .font(.subheadline)
                    Spacer()
                }
                if viewModel.isLoad {
                    Spacer()
                    Text("loading")
                    Spacer()
                } else {
                    VStack {
                        if(viewModel.persons!.count > 0) {
                            List(viewModel.persons!.results) { person in
                                NavigationLink {
                                    Person(person: person)
                                } label: {
                                    Text(person.name)
                                }
                            }.listStyle(.plain)
                        } else {
                            Spacer()
                            Text("no_result")
                            Spacer()
                        }
                        VStack {
                            if(viewModel.persons!.previous != nil || viewModel.persons!.next != nil) {
                                HStack {
                                    Text("current_page")
                                    Text(String(viewModel.page))
                                }
                            }
                            HStack {
                                if(viewModel.persons!.previous != nil) {
                                    Button("previous") {
                                        viewModel.previousPage()
                                    }.padding()
                                }
                                Spacer()
                                if(viewModel.persons!.next != nil) {
                                    Button("next") {
                                        viewModel.nextPage()
                                    }.padding()
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("peoples")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationViewStyle(.stack)
        }
    }
}

//struct Persons_Previews: PreviewProvider {
//    static var previews: some View {
//        Persons()
//    }
//}
