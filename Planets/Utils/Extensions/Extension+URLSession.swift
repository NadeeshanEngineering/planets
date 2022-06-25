//
//  Extention+URLSession.swift
//  Planets
//
//  Created by Nadeeshan Jayawardana on 2022-05-27.
//

import Foundation
import Combine

extension URLSession {
    
    /**
     This extended fuction is here to get the data from any webservice.

     Here is the discussion. This fuction takes URL, Decodable genaric type JSON mapping model. Then return a Result object with the response from the given API.

     - parameter for: URL for the respective webservice.
     - parameter format: Decodable type generic object to map JSON to a model.
     - returns: AnyPublisher<Generic Object, Error> object with the response from the given repository.

     # Notes: #
     1. Parameters must be **URL** type
     2. Parameters must be **Decodable** type
     3. Handle return type because it receives both Success and Failure results.

     # Example #
    ```
     URLSession.call(for: "https://swapi.dev/api/", format: Planets.self)
     ```
    */
    
    static func call<T:Decodable>(for url: URL, format: T.Type) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
