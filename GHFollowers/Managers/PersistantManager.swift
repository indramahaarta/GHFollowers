//
//  PersistantManager.swift
//  GHFollowers
//
//  Created by I Made Indra Mahaarta on 14/04/24.
//

import Foundation

enum PersistantActionType {
    case add, remove
}

enum PersistantManager {
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func updateWith(favorite: Follower, actionType: PersistantActionType, completed: @escaping (GFErrorMessage?) -> Void) {
        retriveFavorite { result in
            switch result {
            case .success(let favorites):
                var retrivedFavorites = favorites
                
                switch actionType {
                case .add:
                    guard !retrivedFavorites.contains(favorite) else {
                        completed(.alreadyInFavorite)
                        return
                    }
                    
                    retrivedFavorites.append(favorite)
                case .remove:
                    retrivedFavorites.removeAll { $0.login == favorite.login }
                }
                
                completed(saveFavorite(favorites: retrivedFavorites))
            case.failure(let error):
                completed(error)
            }
        }
    }
    
    static func retriveFavorite(completed: @escaping (Result<[Follower], GFErrorMessage>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorites))
        }
    }
    
    static func saveFavorite(favorites: [Follower]) -> GFErrorMessage? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.setValue(encodedFavorites, forKey: Keys.favorites)
        } catch {
            return .unableToFavorites
        }
        
        return nil
    }
}
