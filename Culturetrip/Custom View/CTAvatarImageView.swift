//
//  CTAvaterImageView.swift
//  Culturetrip
//
//  Created by MiciH on 4/10/21.
//

import UIKit


class CTAvatarImageView: UIImageView {

    let placeHolderImage = UIImage(named: "logo50")!
    
    let cache = NetworkManager.shard.cache
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeHolderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func downloadImage(urlString: String){
        
        //set image in the cache & don't run the request
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey as NSString){
            self.image = image
            return
        }
        
        //run the request
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            
            if error != nil { return }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            
            self.cache.setObject(image, forKey: cacheKey)
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
        
    }
    
}
