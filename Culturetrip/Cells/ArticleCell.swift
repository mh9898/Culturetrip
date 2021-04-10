//
//  ArticleCell.swift
//  Culturetrip
//
//  Created by MiciH on 4/10/21.
//

import UIKit

enum localImages: String {
    case save, saved, like, liked
}

class ArticleCell: UITableViewCell {

    static let reuseID = "ArticleCell"
    let imageUrl = CTAvatarImageView(frame: .zero)
    let saveImage = CTImageView(imageName: localImages.save.rawValue)
    let savedImage = CTImageView(imageName: localImages.saved.rawValue)
    let likeImage = CTImageView(imageName: localImages.like.rawValue)
    let likedImage = CTImageView(imageName: localImages.liked.rawValue)
    let likesCount = CTTitleLabel(textAlignment: .right, fontSize: 16, weight: .regular, color: .systemBackground)
    
    let category = CTTitleLabel(textAlignment: .left, fontSize: 17, weight: .regular, color: .systemIndigo)
    let title = CTTitleLabel(textAlignment: .left, fontSize: 18)
    let avatarImageView = CTAvatarImageView(frame: .zero)
    let usernameLabel = CTTitleLabel(textAlignment: .left, fontSize: 16, weight: .regular, color: .systemIndigo)
    let updateTime = CTTitleLabel(textAlignment: .left, fontSize: 16, weight: .regular, color: .systemGray)
    
    let padding: CGFloat = 16
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(article: Article) {
        imageUrl.downloadImage(urlString: article.imageUrl)
        
        let isSaved = article.isSaved
        setSaveImage(isSaved: isSaved)
        
        let isLiked = article.isLiked
        let likesCountStr = String(article.likesCount)
        setLikedImageAndCount(isLiked: isLiked, likesCountStr: likesCountStr)
        
        category.text = article.category
        title.text = article.title
        usernameLabel.text = article.author.authorName
        avatarImageView.downloadImage(urlString: article.author.authorAvatar.imageUrl)
        updateTime.text = article.metaData.updateTime.convertToDisplayFormat()
    }
    
    func setSaveImage(isSaved: Bool){
        if isSaved{
            addSubview(savedImage)
            
            NSLayoutConstraint.activate([
                savedImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
                savedImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            ])
        }else{
            addSubview(saveImage)
            
            NSLayoutConstraint.activate([
                saveImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
                saveImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            ])
        }
    }
    
    func setLikedImageAndCount(isLiked: Bool, likesCountStr: String) {
        if isLiked{
            addSubview(likedImage)
            addSubview(likesCount)
            
            likesCount.text = likesCountStr
            
            NSLayoutConstraint.activate([
                likedImage.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
                likedImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
                
                likesCount.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
                likesCount.trailingAnchor.constraint(equalTo: likedImage.leadingAnchor, constant: -6),
            ])
        }else{
            addSubview(likeImage)
            
            NSLayoutConstraint.activate([
                likeImage.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
                likeImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            ])
        }
        
        
        
    }
    
    private func configure(){
        addSubview(imageUrl)
        addSubview(category)
        addSubview(title)
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        addSubview(updateTime)
        
        
        NSLayoutConstraint.activate([
            imageUrl.topAnchor.constraint(equalTo: self.topAnchor),
            imageUrl.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageUrl.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageUrl.heightAnchor.constraint(equalToConstant: 219),
            
            
            category.topAnchor.constraint(equalTo: imageUrl.bottomAnchor, constant: padding),
            category.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            category.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            
            
            title.topAnchor.constraint(equalTo: category.bottomAnchor, constant: padding),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            
            
            avatarImageView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
            avatarImageView.widthAnchor.constraint(equalToConstant: 40),
           
            
            usernameLabel.bottomAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            usernameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),

            
            updateTime.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 4),
            updateTime.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            updateTime.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            
        ])
    }
    
}
