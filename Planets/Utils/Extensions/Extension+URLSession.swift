//
//  Extention+URLSession.swift
//  Planets
//
//  Created by Nadeeshan Jayawardana on 2022-05-27.
//

import Foundation
import Combine

extension URLSession {
    static func call<T:Decodable>(for url: URL, format: T.Type, completion: @escaping (Result<T, URLError>) -> Void) -> AnyCancellable {
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { print ("Received completion: \($0).") }) { result in
                print ("Response: \(result)")
                completion(.success(result))
            }
    }
}
