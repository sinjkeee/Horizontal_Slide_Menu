//
//  HorizintalMenuCollectionView.swift
//  Horizontal_Slide_Menu
//
//  Created by Vladimir Sekerko on 19.09.2022.
//

import UIKit

protocol SelectCollectionViewItemDelegate: AnyObject {
    func selectItem(index: IndexPath)
}

class HorizintalMenuCollectionView: UICollectionView {
    
    private let categoryLayout = UICollectionViewFlowLayout()
    private let nameCategoryArray = ["Auto", "Technique", "Science", "Space", "World News", "Movie", "Other"]
    
    weak var cellDelegate: SelectCollectionViewItemDelegate?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: categoryLayout)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        categoryLayout.minimumInteritemSpacing = 5
        categoryLayout.scrollDirection = .horizontal
        bounces = false
        showsHorizontalScrollIndicator = false
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
        delegate = self
        dataSource = self
        register(HorizontalMenuCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        selectItem(at: [0,0], animated: true, scrollPosition: [])
    }
}

//MARK: - UICollectionViewDataSource
extension HorizintalMenuCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameCategoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HorizontalMenuCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.nameCategoryLabel.text = nameCategoryArray[indexPath.item]
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension HorizintalMenuCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        cellDelegate?.selectItem(index: indexPath)
    }
}

//MARK: -UICollectionViewDelegateFlowLayout
extension HorizintalMenuCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let categoryFont = UIFont(name: "Arial Bold", size: 18)
        let categoryAttributes = [NSAttributedString.Key.font : categoryFont as Any]
        let categoryWidth = nameCategoryArray[indexPath.item].size(withAttributes: categoryAttributes).width + 20
        
        return CGSize(width: categoryWidth,
                      height: collectionView.frame.height)
    }
}
