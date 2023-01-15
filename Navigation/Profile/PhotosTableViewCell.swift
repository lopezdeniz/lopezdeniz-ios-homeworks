//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by MacBook Air on 10.01.2023.
//

import UIKit

final class PhotosTableViewCell: UITableViewCell {
    
    let photoIdentifier = "photo"
    let countInPreview = 3.0

    private lazy var headerPreview: UIStackView = {
        $0.backgroundColor = BackgroundColors.headerPreview
        $0.axis = .horizontal
        $0.alignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    private lazy var label: UILabel = {
        $0.text = "Photos"
        $0.font = .boldSystemFont(ofSize: 24)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private lazy var forward: UIImageView = {
        $0.image = UIImage(systemName: "arrow.forward")
        $0.tintColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private lazy var photoPreview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: photoIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    

override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.backgroundColor = BackgroundColors.previewCell
    addSubviews()
    setConstraints()
}

required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

private func addSubviews() {
    headerPreview.addArrangedSubview(label)
    headerPreview.addArrangedSubview(forward)
    contentView.addSubview(headerPreview)
    contentView.addSubview(photoPreview)
}

private func setConstraints() {
    NSLayoutConstraint.activate([
        
        headerPreview.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Paddings.photosPreview),
        headerPreview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Paddings.photosPreview),
        headerPreview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Paddings.photosPreview),
        
        photoPreview.topAnchor.constraint(equalTo: headerPreview.bottomAnchor, constant: Paddings.photosPreview),
        photoPreview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Paddings.photosPreview),
        photoPreview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Paddings.photosPreview),
        photoPreview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Paddings.photosPreview),
        
    ])
    print(photoPreview.frame.width)
    print(self.frame.width)
    print(UIScreen.main.bounds.width)
    let imgWH = ((UIScreen.main.bounds.width - 2 * Paddings.photosPreview) - countInPreview * Paddings.photo) / (countInPreview + 0.5)
    photoPreview.heightAnchor.constraint(equalToConstant: imgWH).isActive = true
  }
}

extension PhotosTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photoPreview.dequeueReusableCell(withReuseIdentifier: photoIdentifier, for: indexPath) as! PhotosCollectionViewCell
        cell.config(index: indexPath.row, radius: 6)
        return cell
    }
}

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let imgWH = (photoPreview.frame.width - countInPreview * Paddings.photo) / (countInPreview + 0.5) - 1
        return CGSize(width: imgWH, height: imgWH)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Paddings.photo
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let viewController = Photo()
        viewController.name = photos[indexPath.row]

        if let tableView = superview as? UITableView {
            if let viewCell = tableView.dataSource as? UIViewController {
                viewCell.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}
