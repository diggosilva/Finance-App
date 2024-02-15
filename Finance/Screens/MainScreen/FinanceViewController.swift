//
//  FinanceViewController.swift
//  Finance
//
//  Created by Diggo Silva on 13/02/24.
//

import UIKit

class FinanceViewController: UIViewController {
    
    private let financeView = FinanceView()
    var viewModel: FinanceViewModelProtocol = FinanceViewModel()
    
    override func loadView() {
        super.loadView()
        view = financeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainBasicsConfig()
        handleStates()
        viewModel.loadFinances()
    }
    
    func handleStates() {
        viewModel.state.bind { states in
            switch states {
            case .empty:
                self.showEmpty()
            case .loaded:
                self.showLoaded()
            }
            self.financeView.tableView.reloadData()
        }
    }
    
    func showEmpty() {
        self.financeView.emptyImage.isHidden = false
        self.financeView.emptyLabel.isHidden = false
    }
    
    func showLoaded() {
        self.financeView.emptyImage.isHidden = true
        self.financeView.emptyLabel.isHidden = true
        self.financeView.balanceLabel.text = self.viewModel.balanceValue()
        if let valorFinal = Double(self.viewModel.balanceValue()) {
            self.financeView.balanceLabel.textColor = valorFinal < 0 ? .systemRed : .systemGreen
        }
//        self.financeView.tableView.reloadData()
    }
    
    private func mainBasicsConfig() {
        title = "Finanças"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(didTapAddButton))
        financeView.tableView.delegate = self
        financeView.tableView.dataSource = self
        financeView.emptyImage.isHidden = true
        financeView.emptyLabel.isHidden = true
    }
    
    @objc func didTapAddButton() {
        let addValuesVC = AddValuesViewController(finance: Finance(title: "", description: "", tag: "", amount: 0)) // O que tenho que preencher aqui???
        navigationController?.pushViewController(addValuesVC, animated: true)
    }
}

extension FinanceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FinanceTableCell.identifier, for: indexPath) as? FinanceTableCell else { return UITableViewCell() }
        cell.configure(model: viewModel.getFinance(of: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
