//
//  MovieTimeViewController.swift
//  MovieBookingApp
//
//  Created by Zaw Htet Naing on 15/05/2021.
//

import Foundation

import UIKit

class MovieTimeViewController : UIViewController {
    
    // Views
    @IBOutlet weak var viewContainerTimes: UIView!
    @IBOutlet weak var collectionViewDays: UICollectionView!
    @IBOutlet weak var collectionViewAvailableIn: UICollectionView!
    @IBOutlet weak var collectionViewGCGoldenCity: UICollectionView!
    @IBOutlet weak var collectionViewGCWestPoint: UICollectionView!
    
    // Constraints
    @IBOutlet weak var collectionViewHeightAvailableIn: NSLayoutConstraint!
    @IBOutlet weak var collectionViewHeightGCGoldenCity: NSLayoutConstraint!
    @IBOutlet weak var collectionVIewHeightGCWestPoint: NSLayoutConstraint!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        viewContainerTimes.clipsToBounds = true
        viewContainerTimes.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        viewContainerTimes.layer.cornerRadius = 16
        
        registerCells()
        setUpDataSourceAndDelegates()
        
        setUpHeightsForCollectionView()
    }
    
    fileprivate func registerCells(){
        collectionViewDays.register(UINib(nibName: String(describing: DaysCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: DaysCollectionViewCell.self))
        collectionViewAvailableIn.register(UINib(nibName: String(describing: TimeCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: TimeCollectionViewCell.self))
        collectionViewGCGoldenCity.register(UINib(nibName: String(describing: TimeCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: TimeCollectionViewCell.self))
        collectionViewGCWestPoint.register(UINib(nibName: String(describing: TimeCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: TimeCollectionViewCell.self))
    }
    
    fileprivate func setUpDataSourceAndDelegates(){
        collectionViewDays.dataSource = self
        collectionViewDays.delegate = self
        
        collectionViewAvailableIn.dataSource = self
        collectionViewAvailableIn.delegate = self
        
        collectionViewGCWestPoint.dataSource = self
        collectionViewGCWestPoint.delegate = self
        
        collectionViewGCGoldenCity.dataSource = self
        collectionViewGCGoldenCity.delegate = self
    }
    
    fileprivate func setUpHeightsForCollectionView(){
        collectionViewHeightAvailableIn.constant = 56
        collectionViewHeightGCGoldenCity.constant = 56 * 2
        collectionVIewHeightGCWestPoint.constant = 56 * 2
        self.view.layoutIfNeeded()
    }
}

extension MovieTimeViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewDays{
            return 10
        } else if collectionView == collectionViewAvailableIn{
            return 3
        } else {
            return 6
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewDays {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: DaysCollectionViewCell.self), for: indexPath) as? DaysCollectionViewCell else { return UICollectionViewCell() }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TimeCollectionViewCell.self), for: indexPath) as? TimeCollectionViewCell else { return UICollectionViewCell() }
            return cell
        }
    }
}

extension MovieTimeViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewDays{
            return CGSize(width: 60, height: 80)
        } else {
            let width = collectionView.bounds.width / 3
            let height = CGFloat(48)
            return CGSize(width: width, height: height)
        }
    }
}
