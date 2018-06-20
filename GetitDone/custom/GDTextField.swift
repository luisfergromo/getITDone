//
//  GDTextField.swift
//  GetitDone
//
//  Created by Luis Romo on 11/06/18.
//  Copyright © 2018 Luis Romo. All rights reserved.
//

import UIKit

class GDTextField: UITextField {
    var insets:UIEdgeInsets!

    init(frame: CGRect = .zero, placeholder: String = "placeholder", radius: CGFloat = 4, inset: CGFloat = 4) {
        super.init(frame: frame)
        checkIfAutoLayout()

        self.placeholder = placeholder
        self.backgroundColor = .white
        self.layer.cornerRadius = radius
        //self.insets = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: 0)


    }
//    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
//        return UIEdgeInsetsInsetRect(bounds, self.insets)
//    }
//    override func textRect(forBounds bounds: CGRect) -> CGRect {
//        return UIEdgeInsetsInsetRect(bounds, self.insets)
//    }
//    override func editingRect(forBounds bounds: CGRect) -> CGRect {
//        return UIEdgeInsetsInsetRect(bounds, self.insets)
//    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
