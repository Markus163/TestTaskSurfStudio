//
//  ViewController.swift
//  TestTaskSurfStudio
//
//  Created by Марк Михайлов on 08.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureSheet()
    }
    
    //MARK: - Configure Bottom Sheet
    private func configureSheet() {
        let vc = DetailViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.isModalInPresentation = true
        if let sheet = navVC.sheetPresentationController {
            sheet.preferredCornerRadius = 32
            sheet.detents = [.custom(resolver: { context in
                0.41 * context.maximumDetentValue
            }), .custom(resolver: { context in
                0.63 * context.maximumDetentValue
            }), .large()]
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
