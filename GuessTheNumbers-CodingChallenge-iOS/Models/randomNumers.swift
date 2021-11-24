//
//  randomNumers.swift
//  GuessTheNumbers-CodingChallenge-iOS
//
//  Created by Kary Martinez on 11/23/21.
//

import Foundation

struct numbers: Codable {
    let results: [Results]
    let id: Int
}
struct Results: Codable {
    let random: [Random]
}

struct Random: Codable {
    let data: [Int]
    let completionTime: String
}
