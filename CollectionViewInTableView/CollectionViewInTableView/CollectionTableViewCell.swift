//
//  CollectionTableViewCell.swift
//  CollectionViewInTableView
//
//  Created by MANOJ AHER on 4/2/20.
//  Copyright © 2020 MANOJ AHER. All rights reserved.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {
    
    enum Constants {
        static let nibName = "CollectionViewCell"
        static let reuseIdentifier = "CollectionViewCell"
    }

    @IBOutlet private weak var collectionView: UICollectionView!
    private var models: [NewMatch] = []
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        let collectionViewCell = UINib(nibName: Constants.nibName, bundle: nil)
        collectionView.register(collectionViewCell, forCellWithReuseIdentifier: Constants.reuseIdentifier)
    }
    
    func update(newModels: [NewMatch]) {
        models.removeAll()
        models.append(contentsOf: newModels)
        collectionView.reloadData()
    }
}

extension CollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseIdentifier, for: indexPath) as? CollectionViewCell else {
            fatalError()
        }
        
        let model = models[indexPath.section]
        cell.userImage.image = UIImage(named: model.imageName)
        cell.userName.text = model.name
        return cell
    }
}
