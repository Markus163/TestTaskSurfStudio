//
//  HorizontalCollectionView.swift
//  TestTaskSurfStudio
//
//  Created by Марк Михайлов on 11.02.2023.
//

import Foundation
import UIKit

class HorizontalCollectionView: UICollectionView {
    
    //MARK: - Var and Constants
    private let categoryLayout = UICollectionViewFlowLayout()
    private let nameCategoryArray = ["IOS", "Android","Design", "Flutter", "Java", "C+", "Pyton", "C#", "QA", "PM"]
    var numOfItems = 10000
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: categoryLayout)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        categoryLayout.minimumInteritemSpacing = 12
        categoryLayout.scrollDirection = .horizontal
        backgroundColor = .none
        bounces = false
        showsHorizontalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        delegate = self
        dataSource = self
        register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.idetifier)
    }
}

//MARK: - UICollectionViewDataSource
extension HorizontalCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.idetifier, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        cell.nameCategoryLabel.text = nameCategoryArray[indexPath.item % nameCategoryArray.count]
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}

//MARK: - UICollectionViewDelegate
extension HorizontalCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell else{ return }
        if cell.backgroundColor == #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9607843137, alpha: 1) {
            cell.backgroundColor = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
            cell.nameCategoryLabel.textColor = .white
        }
        else {
            cell.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9607843137, alpha: 1)
            cell.nameCategoryLabel.textColor = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension HorizontalCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let categoryFont = UIFont(name: "SF Pro Display", size: 14)
        let categoryAttributes = [NSAttributedString.Key.font : categoryFont as Any]
        let categoryWidth = nameCategoryArray[indexPath.item % nameCategoryArray.count].size(withAttributes: categoryAttributes).width + 48
        return CGSize(width: categoryWidth, height: collectionView.frame.height)
    }
}
