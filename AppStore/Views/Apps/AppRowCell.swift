//
//  AppRowCell.swift
//  AppStore
//
//  Created by Yerlan on 18.12.2021.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    
    var app: Result! {
        didSet {
            nameLabel.text = app?.trackName
            companyLabel.text = app?.releaseNotes
            imageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
            getButton.setTitle(app?.formattedPrice, for: .normal)
        }
    }
    
    let imageView = UIImageView(cornerRadius: 8)
    
    var nameLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 20), numberOfLines: 0)
    
    var companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 13), numberOfLines: 0)
    
    let getButton = UIButton(title: "GET")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        imageView.backgroundColor = .blue
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.layer.cornerRadius = 32/2
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        let stackView = UIStackView(arrangedSubviews: [imageView, VerticalStackView(arrangeSubViews: [nameLabel, companyLabel], spacing: 4), getButton])
        addSubview(stackView)
        stackView.fillSuperview()
        stackView.spacing = 16
        stackView.alignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
