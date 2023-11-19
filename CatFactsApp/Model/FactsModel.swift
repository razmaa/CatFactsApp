//
//  FactsModel.swift
//  CatFactsApp
//
//  Created by nika razmadze on 19.11.23.
//

import Foundation

struct FactModel: Decodable {
    let data: [Fact]
}

struct Fact: Decodable {
    let fact: String
    let length: Int
}

