//
//  ViewController.swift
//  Studio Lamda
//
//  Created by Antonio Flores on 12/25/20.
//

import UIKit
import MapKit
import FirebaseAuth

class DetailPageViewController: UIViewController,MKMapViewDelegate, SegmentedProgressBarDelegate {
    
    private var spb: SegmentedProgressBar!
    
    var markerPosition : CGPoint!
    
    let locationLatLong = CLLocation(latitude: -1.96454, longitude: -79.64187)
    
    let mapView = MKMapView()
    
    let imageArray = clientModel.clientModelArray

    
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

        let icon = UIImage(systemName: "message")
        let iconSize = CGRect(origin: CGPoint.zero, size: CGSize(width: 20, height: 20))
        let iconButton = UIButton(frame: iconSize)
        iconButton.setBackgroundImage(icon, for: .normal)
        let barButton = UIBarButtonItem(customView: iconButton)
        iconButton.addTarget(self, action: #selector(navigateToMessaging), for: .touchUpInside)
        
        
        let signoutBarButton = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(signout))
        
        navigationItem.rightBarButtonItem = barButton
        navigationItem.leftBarButtonItem = signoutBarButton

        segmentedProgressBarSetup()
        
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
    
    func segmentedProgressBarSetup(){
        spb = SegmentedProgressBar(numberOfSegments: 7, stopPoint: 4, duration: 0)

        spb.frame = CGRect(x: 20, y:10, width: view.frame.width - 80, height: 5)
        containerView.addSubview(spb)

                spb.delegate = self
                spb.topColor = UIColor.blue
                spb.bottomColor = UIColor.gray.withAlphaComponent(0.25)
                spb.padding = 2
                spb.startAnimation()
    }
    
    
    public func setupContainer(_ container: UIView) {
        detailPageLayout()
    }
    
    
    @objc func signout(){
        do {
            try FirebaseAuth.Auth.auth().signOut()
            
            let vc = LoginStartScreenViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        } catch {
            fatalError("Error signing out")
        }
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

        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true

    }
    
    
    private func zoomToLocation(with coordinate: CLLocation){
        let zoomRegion = MKCoordinateRegion(center: coordinate.coordinate, latitudinalMeters: 8000, longitudinalMeters: 8000)
        mapView.center = .zero
        mapView.setRegion(zoomRegion, animated: false)
        
    }
    
    
    
    func detailPageLayout(){
        mapViewLayoutContraints()
        projectTitleLabelLayoutContraints()
        locationTitleLabelLayoutContraints()
        progressTitleLabelLayoutContraints()
        progressBarLayoutContraints()
        stackLayoutContraints()
        buttonStackLayoutContraints()
        galleryLayoutContraints()
        collectionViewLayoutContraints()
    }
       
    override var prefersStatusBarHidden: Bool {
            return true
        }

        func segmentedProgressBarChangedIndex(index: Int) {
//            print("Now showing index: \(index)")
            
        }
        
        func segmentedProgressBarFinished() {
//            print("Finished!")
        }
        
        @objc private func tappedView() {
            spb.isPaused = !spb.isPaused
        }
        
        private func updateImage(index: Int) {
            
        }
    
    lazy var collectionView: UICollectionView = {
        var flowlayout = UICollectionViewFlowLayout()
        var collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowlayout)
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
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
    
    lazy var locationTitleLabel: UILabel = {
        var label = UILabel()
        label.text = "Samborodon, Ecuador"
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 18) //Montserrat
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        return label
    }()
    
    lazy var progressTitleLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(descriptor: UIFontDescriptor(name: "HelveticaNeue-Light", size: 8), size: 18)
        label.text = "Your Progress"
        label.textColor = .darkGray
        return label
    }()

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
        return stack
    }()
    
    
    lazy var stackView: UIStackView = {
        var stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.spacing = 100
        return stack
    }()
    
    lazy var appointmentButton: UIButton = {
        var button = UIButton()
        button.setTitle("Appointment", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .blue
        button.clipsToBounds = true
        button.tintColor = .white
        return button
    }()
    
    lazy var detailButton: UIButton = {
        var button = UIButton()
        button.setTitle("Details", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        var stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.spacing = 20
        stack.distribution = .fillEqually
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
        containerView.addSubview(projectTitleLabel)
        projectTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        projectTitleLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 5).isActive = true
        projectTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        projectTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    func locationTitleLabelLayoutContraints() {
        containerView.addSubview(locationTitleLabel)
        locationTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        locationTitleLabel.topAnchor.constraint(equalTo: projectTitleLabel.bottomAnchor, constant: 5).isActive = true
        locationTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        locationTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    func progressTitleLabelLayoutContraints() {
        containerView.addSubview(progressTitleLabel)
        progressTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        progressTitleLabel.topAnchor.constraint(equalTo: locationTitleLabel.bottomAnchor, constant: 15).isActive = true
        progressTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        progressTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    func progressBarLayoutContraints() {
        containerView.addSubview(spb)
        spb.translatesAutoresizingMaskIntoConstraints = false
        spb.topAnchor.constraint(equalTo: progressTitleLabel.bottomAnchor, constant: 10).isActive = true
        spb.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        spb.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        spb.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.02).isActive = true

    }
    
    
    
    func stackLayoutContraints() {
        containerView.addSubview(stackView)
        
        stackView.addArrangedSubview(dimensionstackView)
        stackView.addArrangedSubview(datestackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        dimensionstackView.addArrangedSubview(dimensionLabel)
        dimensionstackView.addArrangedSubview(dimensionInfoLabel)
        
        datestackView.addArrangedSubview(timeLabel)
        datestackView.addArrangedSubview(timeinfoLabel)
        
        
        stackView.topAnchor.constraint(equalTo: spb.bottomAnchor, constant: 5).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }
    
    
    func buttonStackLayoutContraints() {
        containerView.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(appointmentButton)
        buttonStackView.addArrangedSubview(detailButton)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }
    
    func galleryLayoutContraints() {
        containerView.addSubview(gallerytitleLabel)
        gallerytitleLabel.translatesAutoresizingMaskIntoConstraints = false
        gallerytitleLabel.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 30).isActive = true
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? ImageCollectionViewCell else {return UICollectionViewCell()}
      
        let imagearray = imageArray[indexPath.row]
        
        if imagearray.isVideo {
            
        cell.imageView.image = UIImage(named: imagearray.imageName)
        cell.playImageView.image = UIImage(named: "playButton")

        } else {
        cell.imageView.image = UIImage(named: imagearray.imageName)
        }
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
        let imageVC = storyboard.instantiateViewController(withIdentifier: "ImageViewController") as! DetailImageViewController
        imageVC.toIndexPath = indexPath
        self.navigationController?.pushViewController(imageVC, animated: true)
    }
}


