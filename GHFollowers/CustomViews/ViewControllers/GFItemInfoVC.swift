//
//  GFItemInfoVC.swift
//  GHFollowers
//
//  Created by I Made Indra Mahaarta on 13/04/24.
//

import UIKit

class GFItemInfoVC: UIViewController {
    
    let stackView = UIStackView()
    let itemInfoViewOne = GFItemInfoView()
    let itemInfoViewTwo = GFItemInfoView()
    let itemButton = GFButton()
    
    var user: User!
    weak var delegate: UserInfoVCDelegate!
    
    init(user: User!) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundView()
        layoutUI()
        configureStackView()
        configureActionButton()
    }
    
    private func configureBackgroundView() {
        view.layer.cornerRadius = 18
        view.backgroundColor = .secondarySystemBackground
    }
    
    private func configureStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(itemInfoViewOne)
        stackView.addArrangedSubview(itemInfoViewTwo)
    }
    
    private func configureActionButton() {
        itemButton.onTap = {
            self.actionButtonPressed()
        }
    }
    
    @objc func actionButtonPressed() {}
    
    private func layoutUI() {
        view.addSubview(stackView)
        view.addSubview(itemButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            itemButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            itemButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            itemButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            itemButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
