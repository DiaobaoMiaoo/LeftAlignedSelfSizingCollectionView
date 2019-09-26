//
//  ChipContainerView.swift
//  FilterVCTest
//
//  Created by KE MA on 2019-09-26.
//  Copyright © 2019 KE MA. All rights reserved.
//

import UIKit

class ChipContainerView: UIView {
    
    var viewModel: [String] = [] {
        didSet {
            collectionView.reloadData()
            collectionView.collectionViewLayout.invalidateLayout()
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let collectionView: UICollectionView = {
        let alignedFlowLayout = AlignedCollectionViewFlowLayout()
        alignedFlowLayout.horizontalAlignment = .leading
        alignedFlowLayout.estimatedItemSize = .init(width: 100, height: 40)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: alignedFlowLayout)
        collectionView.backgroundColor = .lightGray
        collectionView.register(ChipCell.self, forCellWithReuseIdentifier: "chipCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
}

extension ChipContainerView: UICollectionViewDelegate {
    
}

extension ChipContainerView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chipCell", for: indexPath) as! ChipCell
        cell.text = viewModel[indexPath.row]
        return cell
    }
}
