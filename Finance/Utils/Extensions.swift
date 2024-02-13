//
//  Extensions.swift
//  Finance
//
//  Created by Diggo Silva on 13/02/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach({ self.addSubview($0) })
    }
}

extension String {
    static let lucro = "Lucro 🤑"
    static let gasto = "Gasto 💸"
}

extension UIAlertController {
    func addActions(_ actions: [UIAlertAction]) {
        actions.forEach({ self.addAction($0) })
    }
}

extension UITextField {
    func formatarMoeda() {
        // Defina um observer para o evento de edição da textfield
        self.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }

    @objc private func editingChanged() {
        // Remove caracteres não numéricos do texto atual
        guard let texto = self.text?.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression) else {
            return
        }

        // Converta o texto para um número
        let valorNumerico = (texto as NSString).doubleValue / 100.0

        // Crie um formato de moeda
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")

        // Formate o número como uma string de moeda
        if let valorFormatado = formatter.string(from: NSNumber(value: valorNumerico)) {
            // Defina o texto da textfield com o valor formatado
            self.text = valorFormatado
        }
    }
}
