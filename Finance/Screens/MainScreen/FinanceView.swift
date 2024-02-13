//
//  FinanceView.swift
//  Finance
//
//  Created by Diggo Silva on 13/02/24.
//

import UIKit

class FinanceView: UIView {
    lazy var balanceLabel: UILabel = {
        Components.buildLabel(text: "Saldo: ", textColor: nil, fontSize: .systemFont(ofSize: 16, weight: .semibold))
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FinanceTableCell.self, forCellReuseIdentifier: FinanceTableCell.identifier)
        tableView.backgroundColor = .secondarySystemBackground
        return tableView
    }()
    
    lazy var emptyImage: UIImageView = {
        Components.buildImage()
    }()
    
    lazy var emptyLabel: UILabel = {
        Components.buildLabel(text: "Sem registros", textColor: .secondaryLabel, textAlignment: .center, fontSize: .systemFont(ofSize: 16, weight: .semibold))
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        backgroundColor = .systemBackground
        addSubviews([balanceLabel, tableView, emptyLabel])
        tableView.addSubview(emptyImage)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            balanceLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            balanceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            emptyImage.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            emptyImage.centerYAnchor.constraint(equalTo: tableView.centerYAnchor),
            
            emptyLabel.topAnchor.constraint(equalTo: emptyImage.bottomAnchor),
            emptyLabel.centerXAnchor.constraint(equalTo: emptyImage.centerXAnchor),
        ])
    }
}
