//
//  PokemonDetailViewModel.swift
//  WooStudioCaseStudy
//
//  Created by Ali on 26.03.2023.
//

import Foundation

class PokemonDetailViewModel {
  
  private let name: String
  
  private var response: PokemonDetailResponse?
  
  private var abilities: [AbilityDetail] {
    return response?.abilities.filter { !$0.is_hidden } ?? []
  }
  
  private let networkService = NetworkService()
  
  weak var viewDelegate: PokemonDetailViewDelegate?
  
  init(name: String) {
    self.name = name
  }
  
  
  func numberOfRowsInSection() -> Int {
    return abilities.count
  }
  
  func abilityName(indexPath: IndexPath) -> String {
    return abilities[indexPath.row].ability.name
  }
  
  func fetchPokemonDetail() {
    networkService.fetchPokemonDetail(name: name) { [weak self] response in
      switch response {
      case .success(let data):
        self?.response = data
        
        self?.viewDelegate?.reloadData()
        self?.viewDelegate?.configureTitle(title: data.name)
        self?.viewDelegate?.downloadPokemonImage(urlString: data.sprites.other.home.front_default)
        
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}
