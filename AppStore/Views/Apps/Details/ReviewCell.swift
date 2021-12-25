//
//  ReviewCell.swift
//  AppStore
//
//  Created by Yerlan on 26.12.2021.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    let titleLabel = UILabel(text: "Review Title", font: .boldSystemFont(ofSize: 18), numberOfLines: 0)
    
    let authorLabel = UILabel(text: "Author", font: .boldSystemFont(ofSize: 16), numberOfLines: 0)

    let starsLabel = UILabel(text: "Stars", font: .boldSystemFont(ofSize: 14), numberOfLines: 0)
    
    let bodyLabel = UILabel(text: "Body\nshot\ntitle", font: .boldSystemFont(ofSize: 16), numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.9410843253, green: 0.941242516, blue: 0.975443542, alpha: 1)
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let stackView = VerticalStackView(arrangeSubViews: [
            UIStackView(arrangedSubviews: [
                titleLabel, UIView(), authorLabel
            ]),
            starsLabel,
            bodyLabel
        ], spacing: 12)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
