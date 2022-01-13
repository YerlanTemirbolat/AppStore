//
//  AppDetailCell.swift
//  AppStore
//
//  Created by Yerlan on 22.12.2021.
//

import UIKit


class AppDetailCell: UICollectionViewCell {
    
    var app: Result! {
        didSet {
            nameLabel.text = app?.trackName
            releaseNotesLabel.text = app?.releaseNotes
            appIconImageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
            priceButton.setTitle(app?.formattedPrice, for: .normal)
        }
    }
    
    let appIconImageView = UIImageView(cornerRadius: 16)
    
    let nameLabel = UILabel(text: "detail", font: .boldSystemFont(ofSize: 24), numberOfLines: 2)
    
    let priceButton = UIButton(title: "$4.99")
    
    let whatNewLabel = UILabel(text: "What's new", font: .boldSystemFont(ofSize: 20), numberOfLines: 2)
    
    let releaseNotesLabel = UILabel(text: "Notes", font: .systemFont(ofSize: 16), numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        appIconImageView.backgroundColor = .red
        appIconImageView.constrainWidth(constant: 140)
        appIconImageView.constrainHeight(constant: 140)
        
        priceButton.backgroundColor = .systemBlue
        priceButton.constrainHeight(constant: 32)
        priceButton.layer.cornerRadius = 32/2
        priceButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        priceButton.setTitleColor(.white, for: .normal)
        priceButton.constrainWidth(constant: 80)
        
        let stackView = VerticalStackView(arrangeSubViews: [
            UIStackView(arrangedSubviews: [
                appIconImageView,
                VerticalStackView(arrangeSubViews: [
                    nameLabel,
                    UIStackView(arrangedSubviews: [priceButton, UIView()]),
                    UIView()
                ], spacing: 12)
            ]),
            whatNewLabel,
            releaseNotesLabel
        ], spacing: 16)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//extension UIStackView {
//    convenience init(arrangedSubViews: [UIView], customSpacing: CGFloat = 0) {
//        self.init(arrangedSubViews: arrangedSubViews)
//        self.spacing = customSpacing
//    }
//}
