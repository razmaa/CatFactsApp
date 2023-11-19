//
//  FactsViewModel.swift
//  CatFactsApp
//
//  Created by nika razmadze on 19.11.23.
//

import Foundation
import NetworkManagerPackage

protocol FactViewModelDelegate {
    func viewModelDidLoadData(_ facts: [Fact])
    func showError(_ error: Error)
}

final class FactsViewModel {
    private var factModel = FactModel(data: [])
    private var networkManager = NetworkManager()
    private var url = URL(string: "https://catfact.ninja/facts?limit=28")
    var delegate: FactViewModelDelegate?
    
    func viewDidLoad() {
        fetchData { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let factModel):
                self.delegate?.viewModelDidLoadData(factModel.data)
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
    
    private func fetchData(completion: @escaping (Result<FactModel, Error>) -> Void) {
        networkManager.fetchData(from: url!, responseType: FactModel.self) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let factModel):
                self.factModel = factModel
                completion(.success(factModel))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
