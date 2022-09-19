//
//  HorizontalMenuCollectionViewCell.swift
//  Horizontal_Slide_Menu
//
//  Created by Vladimir Sekerko on 19.09.2022.
//

import UIKit

class HorizontalMenuCollectionViewCell: UICollectionViewCell {
    
    let nameCategoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Arial Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? #colorLiteral(red: 0.7714273334, green: 0.1704859734, blue: 0.1519878209, alpha: 1) : #colorLiteral(red: 0.2021104097, green: 0.21208781, blue: 0.2119153738, alpha: 1)
            nameCategoryLabel.textColor = isSelected ? .black : .white
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = #colorLiteral(red: 0.2021104097, green: 0.21208781, blue: 0.2119153738, alpha: 1)
        layer.cornerRadius = 10
        addSubview(nameCategoryLabel)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            nameCategoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameCategoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
