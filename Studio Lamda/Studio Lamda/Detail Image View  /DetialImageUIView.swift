//
//  DetialImageUIView.swift
//  Studio Lamda
//
//  Created by Antonio Flores on 12/29/20.
//

import UIKit

class DetialImageUIView: UIView {

    let imageArray = [UIImage.init(named: "photo1"),
                      UIImage.init(named: "photo2"),
                      UIImage.init(named: "photo3"),
                      UIImage.init(named: "photo4"),
                      UIImage.init(named: "photo5")]
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        collectionViewLayoutContraints()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView: UICollectionView = {
        var flowlayout = UICollectionViewFlowLayout()
        var collectionView = UICollectionView(frame: bounds, collectionViewLayout: flowlayout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        
        collectionView.backgroundColor = .blue
        return collectionView
    }()
    
    
    func collectionViewLayoutContraints() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
}

extension DetialImageUIView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
    return imageArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath as IndexPath)
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height))
        cell.contentView.addSubview(imageView)
        let imagearray = imageArray[indexPath.row]
        imageView.image = imagearray
//        cell.backgroundColor = UIColor.green
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width / 3 - 1
        
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
}
