//
//  FinanceTableCell.swift
//  Finance
//
//  Created by Diggo Silva on 13/02/24.
//

import UIKit

class FinanceTableCell: UITableViewCell {
    
    static let identifier = "FinanceTableCell"
    
    lazy var titleLabel: UILabel = {
        Components.buildLabel(text: "iPhone", textColor: nil, fontSize: .systemFont(ofSize: 16, weight: .semibold))
    }()
    
    lazy var descriptionLabel: UILabel = {
        Components.buildLabel(text: "Vendi um iPhone 7 Red Edition!!", textColor: .secondaryLabel, fontSize: .systemFont(ofSize: 12, weight: .semibold), numberOfLines: 0)
    }()
    
    lazy var tagLabel: UILabel = {
        Components.buildLabel(text: "Gasto ou lucro? 🤔", textColor: .white, fontSize: .systemFont(ofSize: 16, weight: .semibold))
    }()
    
    lazy var tagBG: UIView = {
        Components.buildViewBG()
    }()
    
    lazy var amountLabel: UILabel = {
        Components.buildLabel(text: "R$ 123,45", textColor: nil, textAlignment: .right, fontSize: .systemFont(ofSize: 12, weight: .semibold))
    }()
    
    let padding: CGFloat = 5
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Finance) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        tagLabel.text = model.tag
        amountLabel.text = "R$ \(model.amount)".replacingOccurrences(of: ",", with: ".")
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        addSubviews([titleLabel, descriptionLabel, tagBG, amountLabel])
        tagBG.addSubview(tagLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: amountLabel.leadingAnchor, constant: -10),
            
            tagBG.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            tagBG.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            tagBG.bottomAnchor.constraint(equalTo: bottomAnchor, constant:  -10),
            
            tagLabel.topAnchor.constraint(equalTo: tagBG.topAnchor, constant: padding),
            tagLabel.leadingAnchor.constraint(equalTo: tagBG.leadingAnchor, constant: padding * 2),
            tagLabel.trailingAnchor.constraint(equalTo: tagBG.trailingAnchor, constant: -padding * 2),
            tagLabel.bottomAnchor.constraint(equalTo: tagBG.bottomAnchor, constant: -padding),
            
            amountLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            amountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
}
