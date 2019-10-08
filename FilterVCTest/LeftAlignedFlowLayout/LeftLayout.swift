//
//  LeftLayout.swift
//  FilterVCTest
//
//  Created by KE MA on 2019-10-06.
//  Copyright © 2019 KE MA. All rights reserved.
//

import UIKit

protocol PinterestLayoutDelegate: AnyObject {
  func collectionView(_ collectionView: UICollectionView, sizeForCellAtIndexPath indexPath: IndexPath) -> CGSize
}

class LeftLayout: UICollectionViewFlowLayout {
    
    weak var delegate: PinterestLayoutDelegate?
    
    private var cache: [UICollectionViewLayoutAttributes] = []
    
    private var contentHeight: CGFloat = 0

    private var contentWidth: CGFloat {
      guard let collectionView = collectionView else {
        return 0
      }
      let insets = collectionView.contentInset
      return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    override var collectionViewContentSize: CGSize {
      return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func invalidateLayout() {
        super.invalidateLayout()
        cache.removeAll()
        contentHeight = 0
        print("--- invalidateLayout")
    }
    
    override func prepare() {
        print("--- prepare")
        guard cache.isEmpty == true,
            let collectionView = collectionView
            else {
                print("--- prepare failed")
                return
        }
        
        var lastCellFrame: CGRect = .zero
        
        for item in 0 ..< collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            
            let currentCellSize = delegate?.collectionView(collectionView, sizeForCellAtIndexPath: indexPath) ?? .zero
            let spacing = evaluatedMinimumInteritemSpacing(at: item)
            
            var frame: CGRect = .zero
            
            if lastCellFrame.maxX + currentCellSize.width + spacing > contentWidth {
                // If we add the new cell to the same row and it exceeds the width of the collectionView minus insets
                // Then we add the cell to a new row.
                frame = CGRect(x: collectionView.contentInset.left,
                               y: lastCellFrame.maxY + spacing,
                               width: min(currentCellSize.width, contentWidth - 10),
                               height: currentCellSize.height)
            } else {
                // Otherwise we add the new cell to the same row.
                frame = CGRect(x: lastCellFrame.maxX + spacing,
                               y: lastCellFrame.origin.y,
                               width: min(currentCellSize.width, contentWidth - 10),
                               height: currentCellSize.height)
            }
            
            print("--- contentWidth \(contentWidth)")
            
            print("--- prepare add attributes to cache \(frame)")
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame
            cache.append(attributes)
            
            lastCellFrame = frame
            contentHeight = max(contentHeight, frame.maxY + spacing)
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
      var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
      
      // Loop through the cache and look for items in the rect
      for attributes in cache {
        if attributes.frame.intersects(rect) {
          visibleLayoutAttributes.append(attributes)
        }
      }
        
        print("--- return visible attributes \(visibleLayoutAttributes)")
      return visibleLayoutAttributes
    }
    
    
    
//    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//        guard indexPath.item < cache.count else {
//            return nil
//        }
//        print("--- return attribute for item at \(indexPath) ")
//        return cache[indexPath.item]
//    }
    
    
    func evaluatedMinimumInteritemSpacing(at sectionIndex:Int) -> CGFloat {
        if let delegate = collectionView?.delegate as? UICollectionViewDelegateFlowLayout {
            let inteitemSpacing = delegate.collectionView?(self.collectionView!, layout: self, minimumInteritemSpacingForSectionAt: sectionIndex)
            if let inteitemSpacing = inteitemSpacing {
                return inteitemSpacing
            }
        }
        return self.minimumInteritemSpacing
        
    }
    
    func evaluatedSectionInsetForItem(at index: Int) ->UIEdgeInsets {
        if let delegate = collectionView?.delegate as? UICollectionViewDelegateFlowLayout {
            let insetForSection = delegate.collectionView?(self.collectionView!, layout: self, insetForSectionAt: index)
            if let insetForSectionAt = insetForSection {
                return insetForSectionAt
            }
        }
        return self.sectionInset
    }
}
