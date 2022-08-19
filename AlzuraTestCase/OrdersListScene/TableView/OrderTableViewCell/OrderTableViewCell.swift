//
//  OrderTableViewCell.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 18.08.2022.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "orderCell"
    static let nibIdentifier = UINib(nibName: "OrderTableViewCell", bundle: nil)
    
    @IBOutlet weak var orderDateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var orderIdLabel: UILabel!
    
    @IBOutlet weak var cellContentView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setShape()
    }
    
    private func setShape() {
        cellContentView.clipsToBounds = true
        cellContentView.layer.cornerRadius = 10
        cellContentView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
