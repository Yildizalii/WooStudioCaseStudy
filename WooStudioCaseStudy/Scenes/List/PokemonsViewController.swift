//
//  PokemonsViewController.swift
//  WooStudioCaseStudy
//
//  Created by Ali on 26.03.2023.
//

import UIKit

protocol PokemonListViewDelegate: AnyObject {
  func reloadData()
}

class PokemonsViewController: UIViewController {
  
  @IBOutlet weak var pokemonListTableView: UITableView!
  
  var viewModel = PokemonListViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewModel.viewDelegate = self
    viewModel.fetchPokemons()
    
    configureNavigationBar()
    configureTableView()
  }
  
  private func configureNavigationBar() {
    title = "Pokemons"
  }
  
  private func configureTableView() {
    pokemonListTableView.delegate = self
    pokemonListTableView.dataSource = self
  }
}

// MARK: - UITableViewDataSource
extension PokemonsViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowsInSection()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    let item = viewModel.pokemonName(indexPath: indexPath)
    cell.textLabel?.text = item.name
    return cell
  }
}

// MARK: - UITableViewDelegate
extension PokemonsViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(indexPath.row)
  }
}

// MARK: - PokemonListViewDelegate
extension PokemonsViewController: PokemonListViewDelegate {
  func reloadData() {
    pokemonListTableView.reloadData()
  }
}
