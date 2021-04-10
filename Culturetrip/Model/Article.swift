//
//  Article.swift
//  Culturetrip
//
//  Created by MiciH on 4/10/21.
//

import UIKit

struct ArticlesData: Codable {
    var data: [Article]
}

struct Article: Codable {
    var metaData: MetaData
    var id: String
    var title: String
    var imageUrl: String
    var isSaved: Bool
    var isLiked: Bool
    var likesCount: Int
    var category: String?
    var author: Author
}

struct MetaData: Codable {
    var creationTime: String
    var updateTime: String
}

struct Author: Codable {
    var id: String
    var authorName: String
    var authorAvatar: AuthorAvatar
}

struct AuthorAvatar: Codable {
    var imageUrl: String
}


