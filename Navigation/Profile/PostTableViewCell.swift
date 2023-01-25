//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by MacBook Air on 21.12.2022.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    
    var cellIndex = 0
    public var depth = true

    private lazy var myAuthor: UILabel = {
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = .black
        $0.numberOfLines = 2
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private lazy var myImage: UIImageView = {
        $0.backgroundColor = .black
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    private lazy var myDescription: UILabel = {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .systemGray
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private lazy var myLikes: UILabel = {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(likePlus)))
        return $0
    }(UILabel())

    private lazy var myViews: UILabel = {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func likePlus(){
        posts[cellIndex].likes += 1
        myLikes.text = "Likes: \(posts[cellIndex].likes)"
    }

    @objc func showDetails(){
        posts[cellIndex].views += 1
        myViews.text = "Views: \(posts[cellIndex].views)"

        if let navigationController = ((superview as? UITableView)?.dataSource as? UIViewController)?.navigationController {
            let vc = ProfileDetailsViewController()
            vc.cellIndex = cellIndex
            vc.depth = false
            let nc = UINavigationController(rootViewController: vc)
            nc.modalPresentationStyle = .fullScreen
            nc.modalTransitionStyle = .flipHorizontal
            navigationController.present(nc, animated: true)
        }
    }

    private func addSubviews() {
        contentView.addSubview(myAuthor)
        contentView.addSubview(myImage)
        contentView.addSubview(myDescription)
        contentView.addSubview(myLikes)
        contentView.addSubview(myViews)
        contentView.subviews.forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([

            myAuthor.topAnchor.constraint(equalTo: contentView.topAnchor, constant: universalS),
            myAuthor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: universalS),
            myAuthor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -universalS),

            myImage.topAnchor.constraint(equalTo: myAuthor.bottomAnchor, constant: universalS),
            myImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            myImage.heightAnchor.constraint(equalTo: myImage.widthAnchor),

            myDescription.topAnchor.constraint(equalTo: myImage.bottomAnchor, constant: universalS),
            myDescription.leadingAnchor.constraint(equalTo: myAuthor.leadingAnchor),
            myDescription.trailingAnchor.constraint(equalTo: myAuthor.trailingAnchor),

            myLikes.topAnchor.constraint(equalTo: myDescription.bottomAnchor, constant: universalS),
            myLikes.leadingAnchor.constraint(equalTo: myAuthor.leadingAnchor),

            myViews.topAnchor.constraint(equalTo: myLikes.topAnchor),
            myViews.trailingAnchor.constraint(equalTo: myAuthor.trailingAnchor),
            myViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,  constant: -universalS),
        ])
    }

    func config(_ index: Int, _ depth: Bool = true) {

        cellIndex = index

        if depth {
            myImage.isUserInteractionEnabled = true
            myImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showDetails)))
        }

        myAuthor.text = posts[index].author
        myImage.image = UIImage(named: posts[index].image)
        myDescription.text = posts[index].description
        myLikes.text = "Likes: \(posts[index].likes)"
        myViews.text = "Views: \(posts[index].views)"
    }
}

