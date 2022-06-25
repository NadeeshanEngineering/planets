//
//  Planets.swift
//  Planets
//
//  Created by Nadeeshan Jayawardana on 2022-05-27.
//

import Foundation
import Combine

struct Planets: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Planet]
}
