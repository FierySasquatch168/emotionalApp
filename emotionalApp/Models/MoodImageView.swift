//
//  MoodImageView.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 16.11.2022.
//

import Foundation
import UIKit

final class MoodImageView: UIView {
    static func create(icon: UIImage) -> MoodImageView {
        let imageView = MoodImageView()
        imageView.iconView.image = icon
        
        return imageView
    }
    
    private let iconView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    
    private func setup() {
        addSubview(iconView)
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        iconView.contentMode = .scaleToFill
    }  
}
