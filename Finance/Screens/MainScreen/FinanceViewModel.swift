//
//  FinanceViewModel.swift
//  Finance
//
//  Created by Diggo Silva on 13/02/24.
//

import Foundation

enum States {
    case empty, loaded
}

protocol FinanceViewModelProtocol {
    var state: Bindable<States> { get set }
    
    //TableView
    func loadFinances()
    func numberOfRows() -> Int
    func getFinance(of indexPath: IndexPath) -> Finance
    func balanceValue() -> String
}

class FinanceViewModel: FinanceViewModelProtocol {
  
    var state: Bindable<States> = Bindable(value: .loaded)
   
    var financeList: [Finance] = []
    
    func loadFinances() {
        financeList = FinanceSingleton.shared.listFinance.value
        handleStates()
        
        // Será chamado toda vez que o botão Adicionar for clicado
        FinanceSingleton.shared.listFinance.bind { listFinance in
            self.financeList = listFinance
            self.handleStates()
        }
    }
    
    func handleStates() {
        if financeList.isEmpty {
            state.value = .empty
        } else {
            state.value = .loaded
        }
    }
    
    func numberOfRows() -> Int {
        financeList.count
    }
    
    func getFinance(of indexPath: IndexPath) -> Finance {
        financeList[indexPath.row]
    }
    
    func balanceValue() -> String {
        var valor: Double = 0
        financeList.forEach { finance in
            if finance.tag == .gasto {
                valor -= finance.amount
            } else {
                valor += finance.amount
            }
        }
        return "Seu saldo: \(String(format: "%.2f", valor))"
    }
}
