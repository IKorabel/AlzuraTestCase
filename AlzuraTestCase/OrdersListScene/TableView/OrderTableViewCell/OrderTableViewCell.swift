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
    
    func setOrder(order: Order) {
        orderDateLabel.text = order.updatedAt
        priceLabel.text = "\(order.sumOriginalPrice) \(order.currency.getCurrencySymbol() ?? "")"
        orderIdLabel.text = "\(order.id)"
    }
    
    private func setShape() {
        cellContentView.clipsToBounds = true
        cellContentView.layer.cornerRadius = 10
        cellContentView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    private func getCurrencySymbol(from currencyCode: String) -> String? {
        
        let locale = NSLocale(localeIdentifier: currencyCode)
        if locale.displayName(forKey: .currencySymbol, value: currencyCode) == currencyCode {
            let newlocale = NSLocale(localeIdentifier: currencyCode.dropLast() + "_en")
            return newlocale.displayName(forKey: .currencySymbol, value: currencyCode)
        }
        return locale.displayName(forKey: .currencySymbol, value: currencyCode)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
