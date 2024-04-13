//
//  GFEmptyStateView.swift
//  GHFollowers
//
//  Created by I Made Indra Mahaarta on 12/04/24.
//

import UIKit

class GFEmptyStateView: UIView {
    
    let messagelabel = GFTitleLabel(textAlignment: .center, fontSize: 28)
    let logoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message: String) {
        super.init(frame: .zero)
        messagelabel.text = message
        configure()
    }
    
    func configure() {
        addSubview(messagelabel)
        addSubview(logoImageView)
        
        // message label
        messagelabel.numberOfLines = 3
        messagelabel.textColor = .secondaryLabel
        
        // logo image
        logoImageView.image = UIImage(named: "empty-state-logo")!
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messagelabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            messagelabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messagelabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            messagelabel.heightAnchor.constraint(equalToConstant: 200),
            
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
            logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 40),

        ])
    }
}
