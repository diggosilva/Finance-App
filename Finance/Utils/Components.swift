//
//  Components.swift
//  Finance
//
//  Created by Diggo Silva on 13/02/24.
//

import UIKit

struct Components {
    static func buildLabel(text: String, textColor: UIColor?, textAlignment: NSTextAlignment = .left, fontSize: UIFont, numberOfLines: Int = 1) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.font = fontSize
        label.numberOfLines = numberOfLines
        return label
    }
    
    static func buildImage() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "circle.slash")?.withTintColor(.secondaryLabel, renderingMode: .alwaysOriginal)
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return imageView
    }
    
    static func buildTextField(placeholder: String, keyboardType: UIKeyboardType = .default) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = placeholder
        textField.clearButtonMode = .whileEditing
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 16, weight: .semibold)
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textField.keyboardType = keyboardType
        return textField
    }
    
    static func buildViewBG() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 14
        view.backgroundColor = .systemPurple
        return view
    }
    
    static func buildButton(setTitle: String, colorDefault: UIColor = .systemBlue, cornerRadius: CGFloat = 4, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(setTitle, for: .normal)
        button.setTitleColor(colorDefault, for: .normal)
        button.backgroundColor = colorDefault.withAlphaComponent(0.25)
        button.layer.borderColor = colorDefault.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = cornerRadius
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.clipsToBounds = true
        button.addTarget(self, action: action, for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }
}
