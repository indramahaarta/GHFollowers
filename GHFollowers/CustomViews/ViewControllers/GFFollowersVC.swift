//
//  GFFollowersVC.swift
//  GHFollowers
//
//  Created by I Made Indra Mahaarta on 13/04/24.
//

import UIKit

class GFFollowersVC : GFItemInfoVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.setItemInfoType(itemInfoType: .followers, with: user.followers)
        itemInfoViewTwo.setItemInfoType(itemInfoType: .following, with: user.following)
        itemButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonPressed() {
        delegate.didTapGetFollowers(for: user)
    }
}
