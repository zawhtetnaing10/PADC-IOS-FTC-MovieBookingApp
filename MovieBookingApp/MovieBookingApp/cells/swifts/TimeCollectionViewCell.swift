//
//  TimeCollectionViewCell.swift
//  MovieBookingApp
//
//  Created by Zaw Htet Naing on 15/05/2021.
//

import UIKit

class TimeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewContainterTime: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewContainterTime.clipsToBounds = true
        viewContainterTime.layer.borderWidth = 1
        viewContainterTime.layer.borderColor = UIColor.gray.cgColor
        
        viewContainterTime.layer.cornerRadius = 4
    }

}
