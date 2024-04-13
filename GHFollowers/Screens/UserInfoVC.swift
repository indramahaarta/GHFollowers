//
//  UserInfoVC.swift
//  GHFollowers
//
//  Created by I Made Indra Mahaarta on 13/04/24.
//

import UIKit

class UserInfoVC: UIViewController {
    
    var username: String!
    let headerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVc))
        navigationItem.rightBarButtonItem = doneButton
        layoutUI()
        
        NetworkManager.shared.getUserInfo(username: username) { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let user):
                    DispatchQueue.main.async {
                        self.addChildVC(childVc: GFUserInfoHeaderVC(user: user), to: self.headerView)
                    }
                case .failure(let error):
                    self.presentGFAlertOnMainThread(title: "Something when wrong", message: error.rawValue, buttonTitle: "Ok")
                    break
            }
        }
    }
    
    func addChildVC(childVc: UIViewController, to containerView: UIView) {
        containerView.addSubview(childVc.view)
        childVc.view.frame = containerView.bounds
        childVc.didMove(toParent: self)
    }
    
    func layoutUI() {
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    @objc func dismissVc() {
        dismiss(animated: true)
    }
}
