//
//  ImageCollectionViewCellCollectionViewCell.swift
//  Studio Lamda
//
//  Created by Antonio Flores on 1/3/21.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        playImageViewConstraints()
        imageViewConstraints()

    }
    
    lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.isUserInteractionEnabled = true

        return imageView
    }()
    
    lazy var playImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    func imageViewConstraints(){
        addSubview(playImageView)
        playImageView.translatesAutoresizingMaskIntoConstraints = false
        playImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        playImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        playImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        playImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2).isActive = true
    }
    
    
    func playImageViewConstraints(){
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
