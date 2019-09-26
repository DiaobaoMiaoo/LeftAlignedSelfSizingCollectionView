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
    
    var heightConstraint: NSLayoutConstraint?
    
    init() {
        super.init(frame: .zero)
        
        print("init")
        initialize()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        let height = collectionView.collectionViewLayout.collectionViewContentSize.height
        heightConstraint?.constant = height
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib")
        initialize()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("coder")
        initialize()
    }

    private func initialize() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        collectionView.addObserver(self, forKeyPath: "contentSize", options: .old, context: nil)
        heightConstraint = heightAnchor.constraint(equalToConstant: 0.0)
        heightConstraint?.isActive = true
    }
    
    override var intrinsicContentSize: CGSize {
        return collectionView.collectionViewLayout.collectionViewContentSize
    }
    
//    private let collectionView: UICollectionView = {
//        let alignedFlowLayout = AlignedCollectionViewFlowLayout()
//        alignedFlowLayout.horizontalAlignment = .leading
//        alignedFlowLayout.estimatedItemSize = .init(width: 100, height: 40)
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: alignedFlowLayout)
//        collectionView.backgroundColor = .lightGray
//        collectionView.register(ChipCell.self, forCellWithReuseIdentifier: "chipCell")
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        return collectionView
//    }()
    
        private let collectionView: UICollectionView = {
            let alignedFlowLayout = UICollectionViewLeftAlignedLayout()
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
