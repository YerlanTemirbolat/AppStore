//
//  TodayCell.swift
//  AppStore
//
//  Created by Yerlan on 26.12.2021.
//

import UIKit

class TodayCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "garden"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
       
        addSubview(imageView)
        imageView.contentMode = .scaleToFill
        imageView.centerInSuperview(size: .init(width: 240, height: 240))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
