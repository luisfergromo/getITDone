//
//  GDHeader.swift
//  GetitDone
//
//  Created by Luis Romo on 06/06/18.
//  Copyright © 2018 Luis Romo. All rights reserved.
//

import UIKit

class GDHeaderView: UIView {
    let bg = GDGradient()
    let titleLabel = GDLabel(size: 14)
    let subtitleLabel = GDLabel(size: 24)
    let addButton = GDButton(title: "+", type: .squareBtn)
    var delegate: GDHeaderDelegate?

    init(frame:CGRect = .zero, title:String = "header", subtitle : String = "Header Subtitle") {
        super.init(frame: frame)
        if frame == .zero{
            translatesAutoresizingMaskIntoConstraints = false
        }
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        setupLayout()
        //delegate?.addItem()
    }
    //TODO: Make stack view by code
    //MARK: https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/LayoutUsingStackViews.html
    func setupLayout(){
        addSubview(bg)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(addButton)

        NSLayoutConstraint.activate([
            bg.leftAnchor.constraint(equalTo: leftAnchor),
            bg.topAnchor.constraint(equalTo: topAnchor),
            bg.rightAnchor.constraint(equalTo: rightAnchor),
            bg.bottomAnchor.constraint(equalTo: bottomAnchor),

            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 12),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20 +  8),
//            titleLabel.rightAnchor.constraint(equalTo: centerXAnchor),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subtitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20 + 8),
            subtitleLabel.rightAnchor.constraint(equalTo: centerXAnchor, constant: 50),

            addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -28),
            addButton.bottomAnchor.constraint(equalTo: subtitleLabel.bottomAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 24),
            addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor, multiplier: 1),
            ])

        addButton.addTarget(self, action: #selector(self.handleAddButton), for: .touchUpInside)
    }

    @objc func handleAddButton(){
//        print("handle to addItem Delegate")
        if let delegate = self.delegate{
            delegate.openAddItemPopup()
        }else{
            print("Error at delegate\nHave to add the delegate to the controller Example: .delegate = self")
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
