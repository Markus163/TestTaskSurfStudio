//
//  DetailViewController.swift
//  TestTaskSurfStudio
//
//  Created by Марк Михайлов on 08.02.2023.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    private let basicButton1 = BasicButton(titleButton: "IOS")
    private let basicButton2 = BasicButton(titleButton: "Android")
    private let basicButton3 = BasicButton(titleButton: "Design")
    private let basicButton4 = BasicButton(titleButton: "QA")
    private let basicButton5 = BasicButton(titleButton: "Flutter")
    private let basicButton6 = BasicButton(titleButton: "PM")
    
    private let horizontalMenuCollectionView = HorizontalCollectionView()
    
    private lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis  = .horizontal
        stackView.distribution  = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 12
        return stackView
    }()
    
    private lazy var stackView2 : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis  = .horizontal
        stackView.distribution  = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 12
        return stackView
    }()
    
    private lazy var stackView3 : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis  = .horizontal
        stackView.distribution  = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 24
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = #colorLiteral(red: 0.1921568513, green: 0.1921568513, blue: 0.1921568513, alpha: 1)
        label.sizeToFit()
        label.text = "Стажировка в Surf"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 3
        label.textColor = #colorLiteral(red: 0.5882352941, green: 0.5843137255, blue: 0.6078431373, alpha: 1)
        label.text = """
Работай над реальными задачами под руководством
опытного наставника и получи возможность стать
частью команды мечты.
"""
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let middleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 2
        label.textColor = #colorLiteral(red: 0.5882352941, green: 0.5843137255, blue: 0.6078431373, alpha: 1)
        label.text = """
Получай стипендию, выстраивай удобный график,
работай на современном железе.
"""
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.5882352941, green: 0.5843137255, blue: 0.6078431373, alpha: 1)
        label.text = "Хочешь к нам?"
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let sendRequestButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
        button.layer.cornerRadius = 30
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitle("Отправить заявку", for: .normal)
        button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        var conf = UIButton.Configuration.plain()
        conf.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 44, bottom: 20, trailing: 44)
        //configuration = conf
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }()
    
    private func configureButton() {
        
        UIView.animate(withDuration: 0.3) {
            self.sendRequestButton.alpha = 0.8
        }
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            UIView.animate(withDuration: 0.3) {
                self.sendRequestButton.alpha = 1.0
            }
        }
    }
    
    @objc func buttonAction() {
        configureButton()
        showAlert()
    }
    
    
    private func showAlert() {
        let alert = UIAlertController(title: "Поздравляем!", message: "Ваша заявка успешно отправлена!",  preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Закрыть", style: .default)
        alert.addAction(closeAction)
        self.present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
 }
    
    private func setupViews() {
//        middleLabel.isHidden = true
//        stackView.isHidden = true
//        stackView2.isHidden = true
        view.addSubview(horizontalMenuCollectionView)
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(middleLabel)
        view.addSubview(stackView)
        view.addSubview(stackView2)
        stackView.addArrangedSubview(basicButton1)
        stackView.addArrangedSubview(basicButton2)
        stackView.addArrangedSubview(basicButton3)
        stackView2.addArrangedSubview(basicButton4)
        stackView2.addArrangedSubview(basicButton5)
        stackView2.addArrangedSubview(basicButton6)
        view.addSubview(bottomLabel)
        view.addSubview(sendRequestButton)
        subtitleLabel.center = view.center
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleLabel.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            bottomLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bottomLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -263),
            bottomLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -78),
            bottomLabel.heightAnchor.constraint(equalToConstant: 20)
        ])

        NSLayoutConstraint.activate([
            sendRequestButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 136),
            sendRequestButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sendRequestButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -58),
            sendRequestButton.widthAnchor.constraint(equalToConstant: 219),
            sendRequestButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            middleLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 80),
            middleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            middleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: middleLabel.bottomAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
            //stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -73),
        ])
        
        NSLayoutConstraint.activate([
            stackView2.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 12),
            stackView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
                    horizontalMenuCollectionView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 12),
                    horizontalMenuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    horizontalMenuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    horizontalMenuCollectionView.heightAnchor.constraint(equalToConstant: 44)
                ])
        
//        NSLayoutConstraint.activate([
//            //stackView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 136),
//
//            stackView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            stackView3.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -58),
//            stackView3.heightAnchor.constraint(equalToConstant: 60),
//            stackView3.widthAnchor.constraint(equalToConstant: 335)
//
//
//        ])
       
    }
    
    @objc private func basicButtonTapped() {
        print("ButtonTap")
    }
}
