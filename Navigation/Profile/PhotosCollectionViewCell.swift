//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by MacBook Air on 10.01.2023.
//

import UIKit

final class PhotosCollectionViewCell: UICollectionViewCell {

    private lazy var img: UIImageView = {
        $0.backgroundColor = BackgroundColors.img
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill  
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = BackgroundColors.postCell
        addSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        contentView.addSubview(img)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([

            img.topAnchor.constraint(equalTo: topAnchor),
            img.leadingAnchor.constraint(equalTo: leadingAnchor),
            img.trailingAnchor.constraint(equalTo: trailingAnchor),
            img.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func config(index: Int, radius: CGFloat = 0.0) {
        img.image = UIImage(named: photos[index])
        img.layer.cornerRadius = radius
    }
}
