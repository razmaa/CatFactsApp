//
//  FactsViewController.swift
//  CatFactsApp
//
//  Created by nika razmadze on 19.11.23.
//

import UIKit

final class FactsViewController: UIViewController {
    
    //MARK: - Properties
    private let factsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        tableView.layer.cornerRadius = 12
        tableView.clipsToBounds = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    private let viewModel = FactsViewModel()
    
    private var facts: [Fact] = []
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.viewDidLoad()
    }
    
    //MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = .systemTeal
        setupTableView()
        setupConstraints()
        setupViewModelDelegate()
    }
    
    private func setupViewModelDelegate() {
        viewModel.delegate = self
    }
    
    private func setupTableView() {
        view.addSubview(factsTableView)
        factsTableView.register(FactsTableViewCell.self, forCellReuseIdentifier: "factCell")
        factsTableView.dataSource = self
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            factsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            factsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            factsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            factsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
}


//MARK: - TableView DataSource
extension FactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        facts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fact = facts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "factCell", for: indexPath)
        if let factCell = cell as? FactsTableViewCell {
            factCell.configure(with: fact)
        }
        return cell
    }
}

//MARK: - FactsViewModel Delegate
extension FactsViewController: FactViewModelDelegate {
    func viewModelDidLoadData(_ facts: [Fact]) {
        self.facts = facts
        DispatchQueue.main.async {
            self.factsTableView.reloadData()
        }
    }
    
    func showError(_ error: Error) {
        print("Error: \(error)")
    }
    
    
}
