//
//  GDButton.swift
//  GetitDone
//
//  Created by Luis Romo on 05/06/18.
//  Copyright © 2018 Luis Romo. All rights reserved.
//

import UIKit


class GDButton: UIButton{
    var title : String!
    var type : ButtonOptions!
    var radius : CGFloat!

    init(title : String = "default button text", frame: CGRect = .zero, type: ButtonOptions = .roundBtn, radius:CGFloat = 20) {
        super.init(frame: frame)
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.title = title
        self.type = type
        self.radius = radius
        self.phaseTwo()

    }
    func phaseTwo(){
        self.setTitle(self.title, for: .normal)
        self.backgroundColor = .white
        if let titleLabel = self.titleLabel{
            titleLabel.font = UIFont.init(name: "Raleway-Regular", size: 16)
        }

        switch type {
        case .roundBtn:
            self.roundedBtn()
        case .squareBtn:
            self.squareBtn()
            break;
        default: break;
        }
    }

    func roundedBtn(){
        self.layer.cornerRadius = self.radius
        self.setTitleColor(.grayZero, for: .normal)
    }

    func squareBtn(){

        self.setTitleColor(.black, for: .normal)
        self.backgroundColor = .white
        if let titleLabel = self.titleLabel{
            titleLabel.font = UIFont.init(name: "Raleway-Regular", size: 24)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
