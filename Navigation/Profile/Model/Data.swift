//
//  Data.swift
//  Navigation
//
//  Created by MacBook Air on 21.12.2022.
//

import UIKit

enum BackgroundColors {
    static let mainView: UIColor = .systemGray5  
    static let tabBar: UIColor = .systemBackground
    static let profileHeader: UIColor = .systemGray5
    static let previewCell: UIColor = .white
    static let postCell: UIColor = .white
    static let img: UIColor = .black
    static let headerPreview: UIColor = .white
}

enum Paddings {
    static let page: CGFloat = 16
    static let photosPreview: CGFloat = 12
    static let photo: CGFloat = 8
}

 


var posts: [Post] = [
    Post(author: "grup 1",
         image: "grup1",
         description: "For Grup 1 Some text here some text duple text, Some text here some text duple text,Some text here some text duple text",
         likes: 1,
         views: 8),
    Post(author: "grup 2",
         image: "grup2",
         description: "For Grup 2Some text here some text duple text, Some text here some text duple text,Some text here some text duple text",
         likes: 23,
         views: 70),
    Post(author: "grup 3",
         image: "grup3",
         description: "For Grup 3 Some text here some text duple text, Some text here some text duple text,Some text here some text duple text",
         likes: 33,
         views: 77),
    Post(author: "grup 4",
         image: "grup4",
         description: "For Grup 5 Some text here some text duple text, Some text here some text duple text,Some text here some text duple text",
         likes: 50,
         views: 7),
]

let photos = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]
