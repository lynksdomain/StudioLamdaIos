//
//  DetailImageViewController.swift
//  Studio Lamda
//
//  Created by Antonio Flores on 12/29/20.
//

import UIKit
import AVKit
import AVFoundation

class DetailImageViewController: UIViewController {

    
    let cellScale: CGFloat = 0.6
        
    var toIndexPath: IndexPath? = nil
    
    var player = AVPlayer()
    
    var playerViewController = AVPlayerViewController()
    
    let clientArray = clientModel.clientModelArray
    
    var imageForVideosArray:Set<Int> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Photos"
        collectionViewConstraints()
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchAction(sender:)))
               collectionView.addGestureRecognizer(pinchGesture)
    }
    
    override func viewDidLayoutSubviews() {
        guard let indexpath = toIndexPath else {return }
//        collectionView.selectItem(at: indexpath, animated: false, scrollPosition: .centeredHorizontally)

        collectionView.scrollToItem(at:indexpath, at: .right, animated: true)
    }

    
    @objc func pinchAction(sender:UIPinchGestureRecognizer){
           var scaleValue: CGFloat!
           if sender.state == .changed || sender.state == .began {
            collectionView.isScrollEnabled = false
           } else {
            collectionView.isScrollEnabled = true
           }
       }

    lazy var collectionView: UICollectionView = {
        var flowlayout = UICollectionViewFlowLayout()
        var collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowlayout)
        collectionView.register(detailImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        flowlayout.scrollDirection = .horizontal
        flowlayout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 20)
        flowlayout.invalidateLayout()
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    func collectionViewConstraints() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }

}

extension DetailImageViewController: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clientArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? detailImageCollectionViewCell else { return UICollectionViewCell() }
        
        cell.tag = indexPath.row

        let imagearray = clientArray[indexPath.row]
        
        if imagearray.isVideo {
            imageForVideosArray.insert(cell.tag)
        }
        
        cell.imageView.image = UIImage(named: imagearray.imageName)


        if imageForVideosArray.contains(indexPath.row){
            cell.playImageView.image = UIImage(named: "playButton")
            cell.playImageView.isHidden = false
            } else {
                cell.playImageView.isHidden = true
            }
        
        print(imageForVideosArray)
            
        return cell
    }
    
    
    func playVideo(name: String) {
        let videoPath = Bundle.main.path(forResource: name, ofType: "mp4")
        let videoPathUrl = URL(fileURLWithPath: videoPath!)
        player = AVPlayer(url: videoPathUrl)
        playerViewController.player = player
        present(playerViewController, animated: true, completion: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                
        return CGSize(width: 400, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.collectionView.scrollToNearestVisibleCollectionViewCell()
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            self.collectionView.scrollToNearestVisibleCollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let client = clientArray[indexPath.row]
        if client.isVideo {
            playVideo(name: client.videoName)
        } else {
            
        }

    }
    

    
}



extension UICollectionView {
    func scrollToNearestVisibleCollectionViewCell() {
        self.decelerationRate = UIScrollView.DecelerationRate.fast
        let visibleCenterPositionOfScrollView = Float(self.contentOffset.x + (self.bounds.size.width / 2))
        var closestCellIndex = -1
        var closestDistance: Float = .greatestFiniteMagnitude
        for i in 0..<self.visibleCells.count {
            let cell = self.visibleCells[i]
            let cellWidth = cell.bounds.size.width
            let cellCenter = Float(cell.frame.origin.x + cellWidth / 2)

            // Now calculate closest cell
            let distance: Float = fabsf(visibleCenterPositionOfScrollView - cellCenter)
            if distance < closestDistance {
                closestDistance = distance
                closestCellIndex = self.indexPath(for: cell)!.row
            }
        }
        if closestCellIndex != -1 {
            self.scrollToItem(at: IndexPath(row: closestCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
}
