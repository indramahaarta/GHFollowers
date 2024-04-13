//
//  FavoritesListVC.swift
//  GHFollowers
//
//  Created by I Made Indra Mahaarta on 11/04/24.
//

import UIKit

class FavoritesListVC: UIViewController {
    let tabbleView = UITableView()
    var favorites: [Follower] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorite()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Favorite"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        view.addSubview(tabbleView)
        tabbleView.frame = view.bounds
        tabbleView.rowHeight = 80
        tabbleView.delegate = self
        tabbleView.dataSource = self
        
        tabbleView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.resourceId)
    }
    
    func getFavorite() {
        PersistantManager.retriveFavorite { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let favorites):
                if favorites.isEmpty {
                    self.showEmptyStateView(with: "No Favorites?\nAdd one followers!", in: self.view)
                } else {
                    DispatchQueue.main.async {
                        self.tabbleView.reloadData()
                        self.view.bringSubviewToFront(self.tabbleView)
                    }
                }
                self.favorites = favorites
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
}

extension FavoritesListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.resourceId) as! FavoriteCell
        let favorite = favorites[indexPath.item]
        cell.set(favorite: favorite)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite = favorites[indexPath.item]
        let destVC = FollowersListVC()
        destVC.username = favorite.login
        destVC.title = favorite.login
        
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else  { return }
        
        let favorite = favorites[indexPath.row]
        favorites.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
        
        PersistantManager.updateWith(favorite: favorite, actionType: .remove) { [weak self] error in
            guard let self = self else { return}
            guard let error = error else { return }
            self.presentGFAlertOnMainThread(title: "Unable to remove", message: error.rawValue, buttonTitle: "Ok")
        }
    }
    
    
}
