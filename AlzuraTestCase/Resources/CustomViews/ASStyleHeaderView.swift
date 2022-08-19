//
//  SectionASStyleHeaderView.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 17.08.2022.
//

import UIKit

class ASStyleHeaderView: UIView {
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .blue
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.text = "Text"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.sizeToFit()
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commoninit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(titleText: String, withInsetFromTop: CGFloat = 0) {
        self.init()
        titleLabel.text = titleText
    }
    
    private func commoninit(withInsetFromTop: CGFloat = 0) {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: withInsetFromTop),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
    
    
    
}
