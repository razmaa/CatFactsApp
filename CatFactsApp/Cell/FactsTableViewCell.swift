//
//  FactsTableViewCell.swift
//  CatFactsApp
//
//  Created by nika razmadze on 19.11.23.
//

import UIKit

class FactsTableViewCell: UITableViewCell {
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 16
        stackView.clipsToBounds = true
        return stackView
    }()
    
    private var catImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "hare")
        imageView.tintColor = .systemPurple
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return imageView
    }()
    
    private var factLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .left
        label.isEnabled = false
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure
    func configure(with model: Fact) {
        factLabel.text = model.fact
    }
    
    //MARK: - Private Methods
    private func setupCell() {
        setupStackView()
        setUpConstraints()
    }
    
    private func setupStackView() {
        addSubview(stackView)
        stackView.addArrangedSubview(catImage)
        stackView.addArrangedSubview(factLabel)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    
}
