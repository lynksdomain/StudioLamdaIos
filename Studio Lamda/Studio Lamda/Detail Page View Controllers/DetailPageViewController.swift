//
//  ViewController.swift
//  Studio Lamda
//
//  Created by Antonio Flores on 12/25/20.
//

import UIKit
import MapKit

class DetailPageViewController: UIViewController,MKMapViewDelegate{

    
    
    let mapView = MKMapView()
//    var collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        let button1 = UIBarButtonItem(image: UIImage.init(systemName: "message.fill") , style: .plain, target: self, action: Selector("action"))
        self.navigationItem.rightBarButtonItem  = button1
        navigationItem.title = "About Us"
        
//        let flowLayout = UICollectionViewFlowLayout()
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.backgroundColor = UIColor.cyan
//
        detailPageLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            
//            let leftMargin:CGFloat = 0
//            let topMargin:CGFloat = view.safeAreaLayoutGuide += 10
//            let mapWidth:CGFloat = view.frame.size.width
//            let mapHeight:CGFloat = 250
        
//        mapView.frame = CGRect(x: leftMargin, y: view.safeAreaLayoutGuide.topAnchor.coon, width: mapWidth, height: mapHeight)
            
        mapView.mapType = MKMapType.standard
            mapView.isZoomEnabled = true
            mapView.isScrollEnabled = true
            
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true

        mapView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true

        mapView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: view.frame.size.width).isActive = true
            // Or, if needed, we can position map in the center of the view
//            mapView.center = view.center
        
//        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
//
//        let annotation = MKPointAnnotation()
//            annotation.coordinate = locValue
//            annotation.title = "Javed Multani"
//            annotation.subtitle = "current location"
//            mapView.addAnnotation(annotation)
//        let london = MKPointAnnotation()
//        london.title = "London"
//        london.coordinate = CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)
//        mapView.addAnnotation(london)
//        mapView.camera.altitude *= 1.4

//            view.addSubview(mapView)
        
        

    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        guard annotation is MKPointAnnotation else { return nil }
//
//        let identifier = "Annotation"
//        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//
//        if annotationView == nil {
//            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//            annotationView!.canShowCallout = true
//        } else {
//            annotationView!.annotation = annotation
//        }
//
//        return annotationView
//    }
    
   func detailPageLayout() {
    view.addSubview(mapView)
    companyTitleLabelLayoutContraints()
    aboutDetailLabelLayoutContraints()
    addressLayoutContraints()
//    collectionViewLayoutContraints()
    
    }
    
//    lazy var collectionView: UICollectionView = {
//        var flowlayout = UICollectionViewFlowLayout()
//        var collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowlayout)
//
//        return collectionView
//    }()
//
    lazy var companyTitleLabel: UILabel = {
        var label = UILabel()
        label.text = "Studio Lamda"
        label.textAlignment = .left
        label.font = UIFont(name: "Open Sans", size: 28) //Montserrat
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        return label
    }()
    
    lazy var aboutDetailLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Architectural Designer · Building Materials ·  Product-Service"
        label.font = UIFont(descriptor: UIFontDescriptor(name: "Montserrat", size: 8), size: 11)
        label.textColor = .darkGray
//        label.font = UIFont.boldSystemFont(ofSize: 11.0)
        return label
    }()
    
    
    lazy var addressTitleLabel: UILabel = {
        var label = UILabel()
        label.text = "Details"
        label.textAlignment = .left
        label.font = UIFont(descriptor: UIFontDescriptor(name: "Open Sans", size: 8), size: 18)
        label.font = UIFont.boldSystemFont(ofSize: 18.0)

        return label
    }()
    
    lazy var addressDetailLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(descriptor: UIFontDescriptor(name: "Montserrat", size: 8), size: 13)
        label.text = "Samborondon Plaza, Ecuador  \n\n +593 99 940 7960  \n\n www.studio-lamda.com"
        label.textColor = .darkGray
        return label
    }()
    
    
    lazy var phoneTitleLabel: UILabel = {
        var label = UILabel()
        label.text = "Address"
        return label
    }()
    
    lazy var phoneDetailLabel: UILabel = {
        var label = UILabel()
        label.text = "+593 99 940 7960"
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.text = ""
        return label
    }()
    
    lazy var DetailLabel: UILabel = {
        var label = UILabel()
        label.text = ""
        return label
    }()
    
    lazy var websiteDetailLabel: UILabel = {
        var label = UILabel()
        label.text = "www.studio-lamda.com"
        return label
    }()
    
    
    
    
    func companyTitleLabelLayoutContraints() {
        view.addSubview(companyTitleLabel)
        companyTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        companyTitleLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 10).isActive = true
        companyTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        companyTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }

    func aboutDetailLabelLayoutContraints() {
        view.addSubview(aboutDetailLabel)
        aboutDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutDetailLabel.topAnchor.constraint(equalTo: companyTitleLabel.bottomAnchor, constant: 5).isActive = true
        aboutDetailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        aboutDetailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    func addressLayoutContraints() {
        view.addSubview(addressTitleLabel)
        view.addSubview(addressDetailLabel)
        
        addressTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        addressDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addressTitleLabel.topAnchor.constraint(equalTo: aboutDetailLabel.bottomAnchor, constant: 20).isActive = true
        addressTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        addressTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        addressDetailLabel.topAnchor.constraint(equalTo: addressTitleLabel.bottomAnchor, constant: 5).isActive = true
        addressDetailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        addressDetailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
//    func collectionViewLayoutContraints() {
//        view.addSubview(collectionView)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.topAnchor.constraint(equalTo: addressDetailLabel.bottomAnchor, constant: 5).isActive = true
//        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
//        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
//        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
//    }
    
}

//extension DetailPageViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
//
//func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
//    {
//        return 20
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
//    {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath as IndexPath)
//
//        cell.backgroundColor = UIColor.green
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
//    {
//        return CGSize(width: 50, height: 50)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
//    {
//        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//    }

//}
