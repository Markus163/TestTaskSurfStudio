//
//  HorizontalCollectionView.swift
//  TestTaskSurfStudio
//
//  Created by Марк Михайлов on 11.02.2023.
//

import Foundation
import UIKit

class HorizontalCollectionView: UICollectionView {
    
    private let catogoryLayout = UICollectionViewFlowLayout()
    private let nameCategoryArray = ["IOS", "Android","Design", "Flutter", "Java", "C+", "Pyton", "C#", "QA", "PM"]
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: catogoryLayout)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        catogoryLayout.minimumInteritemSpacing = 12
        catogoryLayout.scrollDirection = .horizontal
        backgroundColor = .none
        bounces = false
        showsHorizontalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        
        delegate = self
        dataSource = self
        
        register(HorizontalMenuCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }

}

//MARK: - UICollectionViewDataSource
extension HorizontalCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        nameCategoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HorizontalMenuCollectionViewCell else { return UICollectionViewCell() }
        cell.nameCategoryLabel.text = nameCategoryArray[indexPath.item]
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension HorizontalCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        let cell = collectionView.cellForItem(at: indexPath) as! HorizontalMenuCollectionViewCell
        cell.backgroundColor = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
        cell.nameCategoryLabel.textColor = .white
   
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! HorizontalMenuCollectionViewCell
        cell.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9607843137, alpha: 1)
        cell.nameCategoryLabel.textColor = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
    }
    
}
//MARK: - UICollectionViewDelegateFlowLayout
extension HorizontalCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let categoryFont = UIFont(name: "SF Pro Display", size: 14)
        let categoryAttributes = [NSAttributedString.Key.font : categoryFont as Any]
        let categoryWidth = nameCategoryArray[indexPath.item].size(withAttributes: categoryAttributes).width + 48

        
        return CGSize(width: categoryWidth, height: collectionView.frame.height)
    }
}
