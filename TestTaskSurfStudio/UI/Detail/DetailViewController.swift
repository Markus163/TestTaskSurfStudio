//
//  DetailViewController.swift
//  TestTaskSurfStudio
//
//  Created by Марк Михайлов on 08.02.2023.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Constants
    private let horizontalMenuCollectionView = HorizontalCollectionView()
    private let verticalMenuColectionView = VerticalCollectionView()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    let subtitleLabel: UILabel = {
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
    
    let middleLabel: UILabel = {
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
    
    private lazy var sendRequestButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
        button.layer.cornerRadius = 30
        button.setTitle("Отправить заявку", for: .normal)
        button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.titleLabel?.font = UIFont(name: "SF Pro Display", size: 16)
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
    
    //MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let indexPath = IndexPath(row: horizontalMenuCollectionView.numOfItems / 2, section: 0)
        horizontalMenuCollectionView.scrollToItem(at: indexPath, at: .left, animated: false)
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(horizontalMenuCollectionView)
        view.addSubview(verticalMenuColectionView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(middleLabel)
        view.addSubview(backgroundView)
        view.addSubview(bottomLabel)
        view.addSubview(sendRequestButton)
        
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
            middleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            horizontalMenuCollectionView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 12),
            horizontalMenuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            horizontalMenuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            horizontalMenuCollectionView.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            verticalMenuColectionView.topAnchor.constraint(equalTo: middleLabel.bottomAnchor, constant: 12),
            verticalMenuColectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verticalMenuColectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -73),
            verticalMenuColectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            backgroundView.widthAnchor.constraint(equalToConstant: 375),
            backgroundView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}
