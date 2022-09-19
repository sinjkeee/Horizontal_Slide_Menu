//
//  ViewController.swift
//  Horizontal_Slide_Menu
//
//  Created by Vladimir Sekerko on 19.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let mainImageView = MainImageView(image: UIImage(named: "like"))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }


    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(mainImageView)
    }
    
}

extension ViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            mainImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            mainImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
