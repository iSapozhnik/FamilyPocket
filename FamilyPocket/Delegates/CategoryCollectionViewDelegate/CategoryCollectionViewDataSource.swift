//
//  CategoryCollectionViewDataSource.swift
//  FamilyPocket
//
//  Created by Ivan Sapozhnik on 5/14/17.
//  Copyright © 2017 Ivan Sapozhnik. All rights reserved.
//

import UIKit

class CategoryCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    weak var collectionView: UICollectionView!
    let cellIdentidier: String!
    var items: [Category] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    init(withCellIdentifier cellId: String, items: [Any]?, collectionView: UICollectionView) {
        cellIdentidier = cellId
        self.collectionView = collectionView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let c = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentidier, for: indexPath)
        
        if let cell = c as? CategoryCollectionViewCell {

            let category = items[indexPath.row]
            let color: UIColor
            if let colorString = category.color {
                color = colorString.hexColor
            } else {
                color = .gray
            }
            cell.bind(categoryName: category.name, color: color, icon: UIImage(named: category.iconName ?? ""))
            cell.animate()
        }
        
        return c
    }
    
}
