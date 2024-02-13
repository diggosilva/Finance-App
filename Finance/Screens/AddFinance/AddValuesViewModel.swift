//
//  AddValuesViewModel.swift
//  Finance
//
//  Created by Diggo Silva on 13/02/24.
//

import Foundation

enum StateButtonSave {
    case isOn, isOff
}

class AddValuesViewModel {
    
    var stateButton: Bindable<StateButtonSave> = Bindable(value: .isOff)
    var finance: Finance
    
    init(finance: Finance) {
        self.finance = finance
    }
    
    func addFinance() {
        FinanceSingleton.shared.listFinance.value.append(finance)
    }
    
    func handleStates(title: String?, description: String?, amount: String?, type: String?) {
        // Verifique se todos os campos estão preenchidos e sem espaços em branco
        guard let title = title, !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              let description = description, !description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              let type = type, !type.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              let amount = amount, !amount.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            stateButton.value = .isOff
            
            finance.title = title ?? ""
            finance.description = description ?? ""
            finance.tag = type ?? ""
            finance.amount = Double(String(describing: amount)) ?? 0
            return
        }
        
        // Todos os campos estão preenchidos, então habilite o botão de salvar
        stateButton.value = .isOn
    }
}
