//
//  PokemonDetailResponse.swift
//  WooStudioCaseStudy
//
//  Created by Ali on 26.03.2023.
//

import Foundation

struct PokemonDetailResponse: Decodable {
  let abilities: [AbilityDetail]
  let name: String
  let sprites: Sprites
}

struct Sprites: Decodable {
  let other: Other
}

struct Other: Decodable {
  let home: Front
}

struct Front: Decodable {
  let front_default: String
}

struct AbilityDetail: Decodable {
  let ability: Ability
  let is_hidden: Bool
  let slot: Int
}

struct Ability: Decodable {
  let name: String
}


