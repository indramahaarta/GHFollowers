//
//  GFRepositoryVC.swift
//  GHFollowers
//
//  Created by I Made Indra Mahaarta on 13/04/24.
//

import UIKit

class GFRepositoryVC: GFItemInfoVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
        
    private func configureItems() {
        itemInfoViewOne.setItemInfoType(itemInfoType: .repos, with: user.publicRepos)
        itemInfoViewTwo.setItemInfoType(itemInfoType: .gits, with: user.publicGists)
        itemButton.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
    
    override func actionButtonPressed() {
        delegate.didTapGithubProfile(user: user)
    }
}
