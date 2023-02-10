//
//  BasicButton.swift
//  TestTaskSurfStudio
//
//  Created by Марк Михайлов on 09.02.2023.
//

import Foundation
import UIKit

class BasicButton: UIButton {
    
    var titleButton: String
    
    init(titleButton: String) {
        self.titleButton = titleButton
        super.init(frame: .zero)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9607843137, alpha: 1)
        setTitle(titleButton, for: .normal)
        let color = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
        setTitleColor(color, for: .normal)
        setTitleColor(.white, for: .highlighted)
        layer.cornerRadius = 12
        layer.masksToBounds = true
        //        titleLabel?.numberOfLines = 1
        titleLabel?.font = UIFont.systemFont(ofSize: 20)
//                titleLabel?.adjustsFontSizeToFitWidth = true
//                titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
//                titleLabel?.lineBreakMode = .byWordWrapping
//                titleLabel?.adjustsFontForContentSizeCategory = true
        var conf = UIButton.Configuration.plain()
        conf.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
        configuration = conf
        addTarget(self, action: #selector(selectButton), for: .touchUpInside)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func selectButton() {
        let standartColorButton = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9607843137, alpha: 1)
        let colorSelectButton = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
        let selectColorTitle = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        if backgroundColor == standartColorButton {
            backgroundColor = colorSelectButton
            setTitleColor(selectColorTitle, for: .normal)
        } else {
            backgroundColor = standartColorButton
            setTitleColor(colorSelectButton, for: .normal)
        }
    }
    
}
