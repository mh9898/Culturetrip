//
//  CTImageView.swift
//  Culturetrip
//
//  Created by MiciH on 4/10/21.
//

import UIKit

class CTImageView: UIImageView {

    var ctImage = UIImage(named: "logo50")!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(imageName: String) {
        self.init(frame: .zero)
        self.image = UIImage(named: imageName)
    }
    
    private func configure(){
        layer.cornerRadius = 10
        clipsToBounds = true
        self.image = ctImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
