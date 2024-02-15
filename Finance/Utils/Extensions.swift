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

func formatarSaldo(saldo: Double) -> NSAttributedString {
    let saldoParteFixa = "Seu saldo: "
    let saldoParteVariavel = String(format: "R$ %.2f", saldo)

    let atributosFixos: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor.black
    ]

    let corVariavel: UIColor = saldo >= 0 ? .green : .red
    let atributosVariaveis: [NSAttributedString.Key: Any] = [
        .foregroundColor: corVariavel
    ]

    let saldoAtribuido = NSMutableAttributedString(string: saldoParteFixa, attributes: atributosFixos)
    saldoAtribuido.append(NSAttributedString(string: saldoParteVariavel, attributes: atributosVariaveis))

    return saldoAtribuido
}

// Exemplo de uso
let saldo: Double = 100.00
let atributoSaldo = formatarSaldo(saldo: saldo)
