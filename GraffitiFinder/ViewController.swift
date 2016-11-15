//
//  ViewController.swift
//  GraffitiFinder
//
//  Created by Viraj Shah on 11/14/16.
//  Copyright © 2016 VetekConsutling. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let tableView : UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        
        return tv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setupViews()
        setupNavBar()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Test Cell"
        
        return cell
    }
    
    
    lazy var mapView : GMSMapView = {
        let mv = GMSMapView.map(withFrame: .zero, camera: GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0))
        mv.isMyLocationEnabled = true
        mv.translatesAutoresizingMaskIntoConstraints = false
        return mv
    }()
    
    func setupViews(){
        
        //        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        //
        //        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        //        mapView.isMyLocationEnabled = true
        //        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mapView)
        
        mapView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mapView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2).isActive = true
        
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: mapView.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2).isActive = true
        
        
    }
    
    func setupNavBar(){
        
        navigationController?.navigationBar.barTintColor = .red
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = " Graffiti Finder"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addGraffiti))
        
        plusButton.tintColor = .white
        navigationItem.rightBarButtonItem =  plusButton
        
    }
    
    func addGraffiti(){
        print(123)
        
        
    }
    
}

