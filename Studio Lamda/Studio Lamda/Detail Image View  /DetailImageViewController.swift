//
//  DetailImageViewController.swift
//  Studio Lamda
//
//  Created by Antonio Flores on 12/29/20.
//

import UIKit

class DetailImageViewController: UIViewController {

    let imageArray = [UIImage.init(named: "photo1"),
                      UIImage.init(named: "photo2"),
                      UIImage.init(named: "photo3"),
                      UIImage.init(named: "photo4"),
                      UIImage.init(named: "photo5")]
    
    let cellScale: CGFloat = 0.6
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScale)
        let cellHeight = floor(screenSize.height * cellScale)
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = (view.bounds.height - cellHeight) / 2.0
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        

        
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Photos"
        collectionViewConstraints()
    }
    

    lazy var collectionView: UICollectionView = {
        var flowlayout = UICollectionViewFlowLayout()
        var collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowlayout)
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        flowlayout.scrollDirection = .horizontal
        flowlayout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 20)
        flowlayout.invalidateLayout()
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    func collectionViewConstraints() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true

//        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
//        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16).isActive = true
//        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 40).isActive = true
    }

}

extension DetailImageViewController: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
        
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height))
//        imageView.contentMode = .scaleToFill

//        cell.contentView.addSubview(imageView)
        let imagearray = imageArray[indexPath.row]
        cell.imageView.image = imagearray
            
        cell.backgroundColor = .green
        //        cell.backgroundColor = UIColor.green
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let width = collectionView.frame.width / 3 - 1
        
        return CGSize(width: 250, height: 380)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpcaing = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x+scrollView.contentInset.left)/cellWidthIncludingSpcaing
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpcaing - scrollView.contentInset.left, y: scrollView.contentInset.top)
        
        targetContentOffset.pointee = offset
    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let imageVC = storyboard.instantiateViewController(withIdentifier: "ImageViewController")
//            self.navigationController?.pushViewController(imageVC, animated: true)
//    }
    
}
