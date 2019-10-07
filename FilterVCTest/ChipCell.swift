//
//  ChipCell.swift
//  FilterVCTest
//
//  Created by KE MA on 2019-09-26.
//  Copyright © 2019 KE MA. All rights reserved.
//

import UIKit

class ChipCell: UICollectionViewCell {
    
    var text: String? {
        didSet {
            label.text = text
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        layer.cornerRadius = 2.0
        layer.masksToBounds = true
        
        addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 2.0),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2.0),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2.0),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2.0)
        ])
        
        // This is one potential fix for cellWidth exceeding the collectionViewWidth
        let maxWidth = UIScreen.main.bounds.width - 80.0
        label.widthAnchor.constraint(lessThanOrEqualToConstant: maxWidth).isActive = true
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
}
