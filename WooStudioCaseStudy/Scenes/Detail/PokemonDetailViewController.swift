//
//  PokemonDetailViewController.swift
//  WooStudioCaseStudy
//
//  Created by Ali on 26.03.2023.
//

import UIKit
import AlamofireImage

protocol PokemonDetailViewDelegate: AnyObject {
  func reloadData()
  func downloadPokemonImage(urlString: String)
  func configureTitle(title: String)
}

class PokemonDetailViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var pokemonImageView: UIImageView!
  
  var viewModel: PokemonDetailViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.viewDelegate = self
    
    configureTableView()
    
    viewModel.fetchPokemonDetail()
  }
  
  private func configureTableView() {
    tableView.dataSource = self
  }
}

extension PokemonDetailViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowsInSection()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = viewModel.abilityName(indexPath: indexPath).capitalized
    return cell
  }
}

// MARK: - PokemonDetailViewDelegate
extension PokemonDetailViewController: PokemonDetailViewDelegate {
  func reloadData() {
    tableView.reloadData()
  }
  
  func downloadPokemonImage(urlString: String) {
    if let url = URL(string: urlString) {
      pokemonImageView.af.setImage(withURL: url)
    }
  }
  
  func configureTitle(title: String) {
    self.title = title
  }
}
