//
//  HorizontalMenuCollectionViewCell.swift
//  TestTaskSurfStudio
//
//  Created by Марк Михайлов on 11.02.2023.
//

import Foundation
import UIKit

class HorizontalMenuCollectionViewCell: UICollectionViewCell {
    
    let nameCategoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
        label.font = UIFont(name: "SF Pro Display", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    override var isSelected: Bool {
//        didSet {
//            backgroundColor = self.isSelected ? #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1) : #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9607843137, alpha: 1)
//            nameCategoryLabel.textColor = self.isSelected ? .white : #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
//        }
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9607843137, alpha: 1)
        layer.cornerRadius = 12
        addSubview(nameCategoryLabel)
    
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameCategoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameCategoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
