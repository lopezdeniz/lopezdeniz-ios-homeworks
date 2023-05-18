//
//  PhotosViewController.swift
//  Navigation
//
//  Created by MacBook Air on 10.01.2023.
//

import UIKit

class PhotosViewController: UIViewController {

    let photoIdentifier = "photo"

    private lazy var photoGallery: UICollectionView = {
        let layout = UICollectionViewFlowLayout()   
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = BackgroundColors.mainView
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: photoIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let transparentView: UIView = {
        $0.backgroundColor = .black
        $0.alpha = 0
        return $0
    }(UIView())
    
    private lazy var bigImg: UIImageView = {
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.alpha = 0.0
        return $0
    }(UIImageView())

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Photo Gallery"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeImg))
        navigationItem.rightBarButtonItem?.isHidden = true
        
        navigationController?.navigationBar.isHidden = false
        navigationController?.tabBarController?.tabBar.isHidden = true
        
        addSubviews()
        setConstraints()
    }
    
    fileprivate func addSubviews(){
        view.addSubview(photoGallery)
        view.addSubview(transparentView)
        view.addSubview(bigImg)
        view.subviews.forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    fileprivate func setConstraints() {
        NSLayoutConstraint.activate([
            
            photoGallery.topAnchor.constraint(equalTo: view.topAnchor),
            photoGallery.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoGallery.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photoGallery.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            bigImg.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            bigImg.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            bigImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bigImg.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            transparentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            transparentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            transparentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            transparentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
}


extension PhotosViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photoGallery.dequeueReusableCell(withReuseIdentifier: photoIdentifier, for: indexPath) as! PhotosCollectionViewCell
        cell.config(index: indexPath.row)
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let imgWH = (photoGallery.frame.width - 4 * Paddings.photo) / 3
        return CGSize(width: imgWH, height: imgWH)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        bigImg.image = UIImage(named: photos[indexPath.row])
        
        navigationItem.rightBarButtonItem?.isHidden = false
        UIView.animate(withDuration: 1) { [self] in
            bigImg.alpha = 1
            transparentView.alpha = 0.7
        }
    }
    
    @objc func closeImg(){
        navigationItem.rightBarButtonItem?.isHidden = true
        UIView.animate(withDuration: 1) { [self] in
            bigImg.alpha = 0
            transparentView.alpha = 0
        }
    }
}
