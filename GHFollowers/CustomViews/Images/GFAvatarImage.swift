//
//  GFAvatarImage.swift
//  GHFollowers
//
//  Created by I Made Indra Mahaarta on 12/04/24.
//

import UIKit

class GFAvatarImage: UIImageView {
    
    var placeholderImage: UIImage = UIImage(named: "avatar-placeholder")!
    var cache = NetworkManager.shared.cache

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(from urlString: String) {
        let nsUrlString = urlString as NSString
        if let image = cache.object(forKey: nsUrlString) {
            self.image = image
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let _ = error { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            self.cache.setObject(image, forKey: nsUrlString)
            
            DispatchQueue.main.async {
                self.image = image
            }
            
        }
        
        task.resume()
    }
}
