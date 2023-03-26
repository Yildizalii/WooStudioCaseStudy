//
//  NetworkService.swift
//  WooStudioCaseStudy
//
//  Created by Ali on 26.03.2023.
//

import Foundation
import Alamofire

class NetworkService {
  private let baseURLString = "https://pokeapi.co/api/v2"
  
  func fetchPokemons(completion: @escaping (Result<PokemonResponse, Error>) -> Void) {
    let urlString = baseURLString + "/pokemon"
    
    AF.request(urlString).responseDecodable(of: PokemonResponse.self) { response in
      
      switch response.result {
      case .success(let data):
        completion(.success(data))
        
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  
  func fetchPokemonDetail(name: String, completion: @escaping (Result<PokemonDetailResponse, Error>) -> Void) {
    let urlString = baseURLString + "/pokemon/" + name
    
    AF.request(urlString).responseDecodable(of: PokemonDetailResponse.self) { response in
      
      switch response.result {
      case .success(let data):
        completion(.success(data))
        
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
}
