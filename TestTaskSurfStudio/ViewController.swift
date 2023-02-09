//
//  ViewController.swift
//  TestTaskSurfStudio
//
//  Created by Марк Михайлов on 08.02.2023.
//

import UIKit

class ViewController: UIViewController {

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
//    private let startButton: UIButton = {
//        let button = UIButton()
//        button.frame = CGRect(x: 50, y: 50, width: 250, height: 50)
//        button.backgroundColor = .blue
//        button.setTitle("Стажировка в Surf", for: .normal)
//        return button
//    }()
    
    
    @IBAction func showTablePressed() {
        let tableVC = DetailViewController()
        if let sheet = tableVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
        }
        present(tableVC,animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureSheet()
    }

    private func configureSheet() {
        let vc = DetailViewController()
        let navVC = UINavigationController(rootViewController: vc)
        
        navVC.isModalInPresentation = true
        if let sheet = navVC.sheetPresentationController {
            sheet.preferredCornerRadius = 32
            sheet.detents = [.custom(resolver: { context in
                0.41 * context.maximumDetentValue
            }), .custom(resolver: { context in
                0.65 * context.maximumDetentValue
            }), .large()]
            sheet.largestUndimmedDetentIdentifier = .large
//            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
        }
        navigationController?.present(navVC, animated: true)
    }

    private func setupViews() {
        view.addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
}

