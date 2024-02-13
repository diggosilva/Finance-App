//
//  AddValuesViewController.swift
//  Finance
//
//  Created by Diggo Silva on 13/02/24.
//

import UIKit

class AddValuesViewController: UIViewController {
    
    private let addValuesView = AddValuesView()
    var viewModel: AddValuesViewModel
    
    init(finance: Finance) {
        self.viewModel = AddValuesViewModel(finance: finance)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = addValuesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainBasicsConfig()
        allTextfieldsFilled()
        loadFinances()
    }
    
    func allTextfieldsFilled() {
        // Adicione a observação para cada campo de texto
        addValuesView.textFields.forEach({ $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged) })
        
        addValuesView.textFields.forEach({ $0.delegate = self })
        addValuesView.textFields.forEach({ $0.delegate = self })
        
        viewModel.stateButton.bind { _ in
            // Atualize o estado do botão com base no estado do viewModel
            self.navigationItem.rightBarButtonItem?.isEnabled = self.viewModel.stateButton.value == .isOn
        }
    }
    
    func loadFinances() {
        addValuesView.configure(model: viewModel.finance)
    }
    
    @objc func textFieldDidChange() {
        // Chame o método handleStates sempre que houver uma alteração nos campos de texto
        viewModel.handleStates(title: addValuesView.titleTextField.text,
                               description: addValuesView.descriptionTextField.text,
                               amount: addValuesView.amountTextField.text,
                               type: addValuesView.typeTextField.text)
    }
    
    private func mainBasicsConfig() {
        title = "Add Gastos/Lucros"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSaveButton))
        navigationItem.rightBarButtonItem?.isEnabled = false // Se todos os campos estiverem preenchidos, o botão fica habilitado pra salvar
        addValuesView.delegate = self
    }
    
    @objc func didTapSaveButton() {
        // ENVIAR OS DADOS PRA TABLEVIEW
        
//        viewModel.addFinance(title: <#String?#>, description: <#String?#>, amount: <#String?#>, type: <#String?#>)
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func actionTypeButton(string: String, uiColor: UIColor) {
        self.addValuesView.typeTextField.text = string
        self.addValuesView.typeButton.setTitle(string, for: .normal)
        self.addValuesView.typeButton.setTitleColor(uiColor, for: .normal)
        self.addValuesView.typeButton.backgroundColor = uiColor.withAlphaComponent(0.25)
        self.addValuesView.typeButton.layer.borderColor = uiColor.cgColor
    }
}

extension AddValuesViewController: AddValuesViewDelegate {
    func didTapTypeButton() {
        let alert = UIAlertController(title: "Selecione um tipo", message: "Sua finança é um:", preferredStyle: .alert)
        
        let gasto = UIAlertAction(title: "Gasto", style: .default, handler: { actionGasto in
            self.actionTypeButton(string: .gasto, uiColor: .systemRed)
        })
        
        let lucro = UIAlertAction(title: "Lucro", style: .default, handler: { actionLucro in
            self.actionTypeButton(string: .lucro, uiColor: .systemGreen)
        })
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addActions([gasto, lucro, cancelar])
        present(alert, animated: true)
    }
}

extension AddValuesViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Entrou na TextField")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Saiu da TextField")
    }
    
}
