//
//  ImageCollectionViewCell.swift
//  Studio Lamda
//
//  Created by Antonio Flores on 12/30/20.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        playImageViewConstraints()
        imageViewConstraints()
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinch(sender:)))
                pinch.delegate = self
        self.imageView.addGestureRecognizer(pinch)
                
                let pan = UIPanGestureRecognizer(target: self, action: #selector(pan(sender:)))
                pan.delegate = self
        self.imageView.addGestureRecognizer(pan)
    }
    
    func setUpView(){
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(self.pinch(sender:)))
        self.imageView.addGestureRecognizer(pinch)
    }
    
    var isZooming = false
    
    var originalImageCenter:CGPoint?

    
    
   
    
     func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    return true
    }
    
    
    @objc func pan(sender: UIPanGestureRecognizer) {
            if self.isZooming && sender.state == .began {
                self.originalImageCenter = sender.view?.center
            } else if self.isZooming && sender.state == .changed {
                let translation = sender.translation(in: self)
                if let view = sender.view {
                    view.center = CGPoint(x:view.center.x + translation.x,
                                          y:view.center.y + translation.y)
                }
                sender.setTranslation(CGPoint.zero, in: self.imageView.superview)
            }
        }
        
    @objc func pinch(sender:UIPinchGestureRecognizer) {
            
            if sender.state == .began {
                let currentScale = imageView.frame.size.width / self.imageView.bounds.size.width
                let newScale = currentScale*sender.scale
                
                if newScale > 1 {
                    self.isZooming = true
                }
            } else if sender.state == .changed {
                
                guard let view = sender.view else {return}
                
                let pinchCenter = CGPoint(x: sender.location(in: view).x - view.bounds.midX,
                                          y: sender.location(in: view).y - view.bounds.midY)
                let transform = view.transform.translatedBy(x: pinchCenter.x, y: pinchCenter.y)
                    .scaledBy(x: sender.scale, y: sender.scale)
                    .translatedBy(x: -pinchCenter.x, y: -pinchCenter.y)
                
                let currentScale = self.imageView.frame.size.width / self.imageView.bounds.size.width
                var newScale = currentScale*sender.scale
                
                if newScale < 1 {
                    newScale = 1
                    let transform = CGAffineTransform(scaleX: newScale, y: newScale)
                    self.imageView.transform = transform
                    sender.scale = 1
                }else {
                    view.transform = transform
                    sender.scale = 1
                }
                
            } else if sender.state == .ended || sender.state == .failed || sender.state == .cancelled {
                
                guard let center = self.originalImageCenter else {return}
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.imageView.transform = CGAffineTransform.identity
                    self.imageView.center = center
                }, completion: { _ in
                    self.isZooming = false
                })
            }
            
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
