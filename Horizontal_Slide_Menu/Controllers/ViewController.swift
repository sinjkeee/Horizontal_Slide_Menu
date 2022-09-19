//
//  ViewController.swift
//  Horizontal_Slide_Menu
//
//  Created by Vladimir Sekerko on 19.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let mainImageView = MainImageView(image: UIImage(named: "other"))
    private let horizontalCollectionView = HorizintalMenuCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }

    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(mainImageView)
        view.addSubview(horizontalCollectionView)
        horizontalCollectionView.cellDelegate = self
    }
}

extension ViewController: SelectCollectionViewItemDelegate {
    func selectItem(index: IndexPath) {
        print(index)
    }
}

extension ViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            horizontalCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            horizontalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            horizontalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            horizontalCollectionView.heightAnchor.constraint(equalToConstant: 40),
            
            mainImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainImageView.topAnchor.constraint(equalTo: horizontalCollectionView.bottomAnchor, constant: 5),
            mainImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
}
