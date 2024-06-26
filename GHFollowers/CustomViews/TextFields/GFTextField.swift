//
//  GFTextField.swift
//  GHFollowers
//
//  Created by I Made Indra Mahaarta on 11/04/24.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(placeholder: String, returnKeyType: UIReturnKeyType, autocapitalizationType: UITextAutocapitalizationType = .words) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        self.returnKeyType = returnKeyType
        self.autocapitalizationType = autocapitalizationType
        configure()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
    }
}
