//
//  PokemonListViewModel.swift
//  WooStudioCaseStudy
//
//  Created by Ali on 26.03.2023.
//

import Foundation

class PokemonListViewModel {
  
  private var pokemonList: PokemonResponse = PokemonResponse(results: [])
  
  private var networkService = NetworkService()
  
  weak var viewDelegate: PokemonListViewDelegate?
  
  func fetchPokemons() {
    networkService.fetchPokemons { [weak self] response in
      
      switch response {
      case .success(let data):
        self?.pokemonList = data
        self?.viewDelegate?.reloadData()
        
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
  
  func numberOfRowsInSection() -> Int {
    return pokemonList.results.count
  }
  
  func pokemonName(indexPath: IndexPath) -> PokemonListItem {
    return pokemonList.results[indexPath.row]
  }
}
