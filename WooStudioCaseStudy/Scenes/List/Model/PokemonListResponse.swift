//
//  PokemonListResponse.swift
//  WooStudioCaseStudy
//
//  Created by Ali on 26.03.2023.
//

import Foundation

struct PokemonResponse: Decodable {
  let results: [PokemonListItem]
}

struct PokemonListItem: Decodable {
  let name: String
}
