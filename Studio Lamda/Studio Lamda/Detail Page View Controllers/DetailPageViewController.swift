//
//  ViewController.swift
//  Studio Lamda
//
//  Created by Antonio Flores on 12/25/20.
//

import UIKit
import MapKit

class DetailPageViewController: UIViewController,MKMapViewDelegate {
    
    
//    let detailView = DetialImageUIView()
    
    var markerPosition : CGPoint!
    
    let locationLatLong = CLLocation(latitude: -1.96454, longitude: -79.64187)
    
    let mapView = MKMapView()
    
    let clientArray = clientModel.clientModelArray
    
    let imageArray = [UIImage.init(named: "photo1"),
                      UIImage.init(named: "photo2"),
                      UIImage.init(named: "photo3"),
                      UIImage.init(named: "photo4"),
                      UIImage.init(named: "photo5")]
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = .white
        view.frame = self.view.bounds
        view.contentSize = contentViewSize
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var containerView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.frame.size = contentViewSize
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        navigationController?.navigationBar.prefersLargeTitles = true
        let icon = UIImage(systemName: "message")
        let iconSize = CGRect(origin: CGPoint.zero, size: CGSize(width: 20, height: 20))
        let iconButton = UIButton(frame: iconSize)
        iconButton.setBackgroundImage(icon, for: .normal)
        let barButton = UIBarButtonItem(customView: iconButton)
        iconButton.addTarget(self, action: #selector(navigateToMessaging), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = barButton
//        navigationItem.title = "Your Project"
        
        //        let flowLayout = UICollectionViewFlowLayout()
        //        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        //        collectionView.delegate = self
        //        collectionView.dataSource = self
        //        collectionView.backgroundColor = UIColor.cyan
        //
        mapView.isOpaque = true
        mapView.isZoomEnabled = false
        mapView.isScrollEnabled = false
        mapView.isUserInteractionEnabled = false
        let annotation = MKPointAnnotation()
        annotation.title = "Studio Lamda"
        annotation.coordinate = CLLocationCoordinate2D(latitude: -1.96454, longitude: -79.73187)
        
        mapView.setCenter(locationLatLong.coordinate, animated: false)
        mapView.addAnnotation(annotation)
        
        
        zoomToLocation(with: locationLatLong)
        
        
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollView.addSubview(containerView)
        setupContainer(containerView)

        
    }
    
    public func setupContainer(_ container: UIView) {
        detailPageLayout()
    }
    
    @objc func navigateToMessaging() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let messageVC = storyboard.instantiateViewController(withIdentifier: "MessagingViewController")
        self.navigationController?.pushViewController(messageVC, animated: true)
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        
        let identifier = "Gino's Restaurant"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
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
        //
        
        
        
        
    }
    
    
    private func zoomToLocation(with coordinate: CLLocation){
        let zoomRegion = MKCoordinateRegion(center: coordinate.coordinate, latitudinalMeters: 8000, longitudinalMeters: 8000)
        mapView.center = .zero
        mapView.setRegion(zoomRegion, animated: false)
        
    }
    
    
    
    func detailPageLayout(){

        mapViewLayoutContraints()
        projectTitleLabelLayoutContraints()
        stackLayoutContraints()
//      projectCapacityLabelLayoutContraints()
//      estimateTimeLayoutContraints()
        galleryLayoutContraints()
        collectionViewLayoutContraints()

    }
       
    lazy var collectionView: UICollectionView = {
        var flowlayout = UICollectionViewFlowLayout()
        var collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowlayout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    
    lazy var projectTitleLabel: UILabel = {
        var label = UILabel()
        label.text = "Gino's Restaurant"
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 28) //Montserrat
        label.font = UIFont.boldSystemFont(ofSize: 28.0)
        return label
    }()
    
//    lazy var projectTitleLabel: UILabel = {
//        var label = UILabel()
//        label.text = "Gino's Restaurant"
//        label.textAlignment = .left
//        label.font = UIFont(name: "HelveticaNeue-Medium", size: 28) //Montserrat
//        label.font = UIFont.boldSystemFont(ofSize: 28.0)
//        return label
//    }()
    
    

    lazy var dimensionLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(descriptor: UIFontDescriptor(name: "HelveticaNeue-Medium", size: 8), size: 18)
        label.text = "Dimension"
        label.textColor = .black
        return label
    }()
    
    lazy var dimensionInfoLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(descriptor: UIFontDescriptor(name: "HelveticaNeue-Light", size: 8), size: 18)
        label.text = "1445 sq.ft"
        label.textColor = .darkGray
        return label
    }()
    
    lazy var dimensionstackView: UIStackView = {
        var stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.vertical
//        stack.distribution = UIStackView.Distribution.equalSpacing
//        stack.alignment = UIStackView.Alignment.center
//        stack.spacing = 5
        return stack
    }()

    
    lazy var timeLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(descriptor: UIFontDescriptor(name: "HelveticaNeue-Medium", size: 8), size: 18)
        label.text = "Proposed Date"
        label.textColor = .black
        return label
    }()
    
    lazy var timeinfoLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(descriptor: UIFontDescriptor(name: "HelveticaNeue-Light", size: 8), size: 18)
        label.text = "Jan 12, 2021"
        label.textColor = .darkGray
        return label
    }()
    
    lazy var datestackView: UIStackView = {
        var stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.vertical
//        stack.distribution = UIStackView.Distribution.equalSpacing
//        stack.alignment = UIStackView.Alignment.center
//        stack.spacing = 5
        return stack
    }()
    
    
    lazy var stackView: UIStackView = {
        var stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
//        stack.distribution = UIStackView.Distribution.equalSpacing
//        stack.alignment = UIStackView.Alignment.center
        stack.spacing = 140
        return stack
    }()
    
    
    lazy var gallerytitleLabel: UILabel = {
        var label = UILabel()
        label.text = "Gallery"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(descriptor: UIFontDescriptor(name: "HelveticaNeue-Medium", size: 8), size: 18)
        label.font = UIFont.boldSystemFont(ofSize: 22.0)
        return label
    }()
    
    
    
    func mapViewLayoutContraints() {
        containerView.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        mapView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        mapView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.18).isActive = true
        mapView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: view.frame.size.width).isActive = true
    }
    
    
    func projectTitleLabelLayoutContraints() {
        view.addSubview(projectTitleLabel)
        projectTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        projectTitleLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 5).isActive = true
        projectTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        projectTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    
    func stackLayoutContraints() {
        containerView.addSubview(stackView)
        
        stackView.addArrangedSubview(dimensionstackView)
        stackView.addArrangedSubview(datestackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        dimensionstackView.addArrangedSubview(dimensionLabel)
        dimensionstackView.addArrangedSubview(dimensionInfoLabel)
//        dimensionstackView.addSubview(dimensionLabel)
//        dimensionstackView.addSubview(dimensionInfoLabel)
//
//        dimensionstackView.addArrangedSubview(dimensionLabel)
//        dimensionstackView.addArrangedSubview(dimensionInfoLabel)
        
        datestackView.addArrangedSubview(timeLabel)
        datestackView.addArrangedSubview(timeinfoLabel)
        
        
        stackView.topAnchor.constraint(equalTo: projectTitleLabel.bottomAnchor, constant: 18).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }
    
//    func estimateTimeLayoutContraints() {
//        containerView.addSubview(estimateTimeLabel)
//
//
//        estimateTimeLabel.topAnchor.constraint(equalTo: projectCapacityLabel.bottomAnchor, constant: 5).isActive = true
//        estimateTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
//        estimateTimeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
//    }

    
    func galleryLayoutContraints() {
        containerView.addSubview(gallerytitleLabel)
        
        gallerytitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        gallerytitleLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30).isActive = true
        gallerytitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        gallerytitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    func collectionViewLayoutContraints() {
        containerView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 0).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.gallerytitleLabel.bottomAnchor, constant: 16).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: 0).isActive = true
    }
    
}

extension DetailPageViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let imageVC = storyboard.instantiateViewController(withIdentifier: "ImageViewController")
            self.navigationController?.pushViewController(imageVC, animated: true)
    }
}


