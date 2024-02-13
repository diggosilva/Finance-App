//
//  AddValuesView.swift
//  Finance
//
//  Created by Diggo Silva on 13/02/24.
//

import UIKit

protocol AddValuesViewDelegate: AnyObject {
    func didTapTypeButton()
}

class AddValuesView: UIView {
    
    weak var delegate: AddValuesViewDelegate?
    
    lazy var titleLabel: UILabel = {
        Components.buildLabel(text: "TÍTULO", textColor: .secondaryLabel, fontSize: .systemFont(ofSize: 18, weight: .semibold))
    }()
    
    lazy var titleTextField: UITextField = {
        Components.buildTextField(placeholder: "Mac Studio")
    }()
    
    lazy var descriptionLabel: UILabel = {
        Components.buildLabel(text: "DESCRIÇÃO", textColor: .secondaryLabel, fontSize: .systemFont(ofSize: 18, weight: .semibold))
    }()
    
    lazy var descriptionTextField: UITextField = {
        Components.buildTextField(placeholder: "Comprei um novo Mac na loja da Apple")
    }()
    
    lazy var amountLabel: UILabel = {
        Components.buildLabel(text: "QUANTIA", textColor: .secondaryLabel, fontSize: .systemFont(ofSize: 18, weight: .semibold))
    }()
    
    lazy var amountTextField: UITextField = {
        Components.buildTextField(placeholder: "R$ 123,45", keyboardType: .decimalPad)
    }()
    
    lazy var typeLabel: UILabel = {
        Components.buildLabel(text: "TIPO", textColor: .secondaryLabel, fontSize: .systemFont(ofSize: 18, weight: .semibold))
    }()
    
    lazy var typeTextField: UITextField = {
        Components.buildTextField(placeholder: "")
    }()
    
    lazy var typeButton: UIButton = {
        Components.buildButton(setTitle: "Selecione", action: #selector(didTapTypeButton))
    }()
    
    lazy var textFields: [UITextField] = [titleTextField, descriptionTextField, amountTextField, typeTextField]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Finance) {
        titleTextField.text = model.title
        descriptionTextField.text = model.description
        amountTextField.text = model.amount == 0 ? "" : "\(model.amount)"
        typeTextField.text = model.tag
    }
    
    @objc func didTapTypeButton() {
        delegate?.didTapTypeButton()
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        backgroundColor = .secondarySystemBackground
        addSubviews([titleLabel, titleTextField, descriptionLabel, descriptionTextField, amountLabel, amountTextField, typeLabel, typeButton])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            typeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            typeLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            typeButton.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 10),
            typeButton.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor),
            typeButton.widthAnchor.constraint(equalToConstant: 100),
            
            titleLabel.topAnchor.constraint(equalTo: typeButton.bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            titleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            descriptionTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            descriptionTextField.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor),
            descriptionTextField.trailingAnchor.constraint(equalTo: titleTextField.trailingAnchor),
            
            amountLabel.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 30),
            amountLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            amountLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            amountTextField.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 10),
            amountTextField.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor),
            amountTextField.trailingAnchor.constraint(equalTo: titleTextField.trailingAnchor),
        ])
    }
}
