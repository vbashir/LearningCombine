//
//  Api.swift
//  MyApp
//
//  Created by Башир Валиев on 25.03.2022.
//

import Foundation
import Combine

class Api {
    
    static let shared = Api()
    
    private let apiUrl = "https://swapi.dev/api/"
    private let urlSession = URLSession.shared
    
    func fetch(category: ApiCategory, search: String?, page: Int?) -> AnyPublisher<Data, APIError> {
        var repareUrl = apiUrl + category.rawValue
        if let search = search {
            repareUrl = repareUrl + "?search=\(search)"
        }
        
        if let page = page {
            repareUrl = repareUrl + "&page=\(page)"
        }
        let url = URL(string: repareUrl)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return URLSession.DataTaskPublisher(request: request, session: .shared)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw APIError.unknown
                }
                return data
            }
            .mapError { error in
                if let error = error as? APIError {
                    return error
                } else {
                    return APIError.apiError(reason: error.localizedDescription)
                }
            }
            .eraseToAnyPublisher()
    }
    
    private func prepareGetParam<T>(_ param: T) -> String {
        return ""
    }
    
    enum ApiCategory: String {
        case planets
        case peoples
        case starships
        case vehicles
        case species
        case films
    }
    
    enum APIError: Error, LocalizedError {
        case unknown, apiError(reason: String)

        var errorDescription: String? {
            switch self {
            case .unknown:
                return "Unknown error"
            case .apiError(let reason):
                return reason
            }
        }
    }
}
