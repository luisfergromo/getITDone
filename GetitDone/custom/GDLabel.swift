//
//  GDLabel.swift
//  GetitDone
//
//  Created by Luis Romo on 04/06/18.
//  Copyright © 2018 Luis Romo. All rights reserved.
//

import UIKit

class GDLabel: UILabel {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(title: String = "deafult",color: UIColor = .white,size: CGFloat = 16 ,frame: CGRect = .zero, textAlign: NSTextAlignment = .left){
        super.init(frame: frame)
        if frame == .zero{
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.text = title
        self.textColor = color
        self.font = UIFont.init(name: "Raleway-Regular", size: size)
        self.textAlignment = textAlign
    }
}
