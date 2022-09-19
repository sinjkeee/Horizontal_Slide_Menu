//
//  MainImageView.swift
//  Horizontal_Slide_Menu
//
//  Created by Vladimir Sekerko on 19.09.2022.
//

import UIKit
import Foundation

class MainImageView: UIImageView {
    
    override init(image: UIImage?) {
        super.init(image: image)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGroupedBackground
        layer.cornerRadius = 10
        contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
