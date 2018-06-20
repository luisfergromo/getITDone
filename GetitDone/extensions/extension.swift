//
//  extension.swift
//  GetitDone
//
//  Created by Luis Romo on 03/06/18.
//  Copyright © 2018 Luis Romo. All rights reserved.
//

import UIKit

extension UIColor{
    /***
    RGB: 0x + hexCode
    - returns RGB color
     */
    static var blueZero:UIColor{return UIColor.init(rgb: 0x64E4FF)}
    static var blueOne:UIColor{return UIColor.init(rgb: 0x3A7BD5)}
    static var grayZero:UIColor{return UIColor.init(rgb: 0x9B9B9B)}
    static var grayOne:UIColor{return UIColor.init(rgb: 0x242424)}

    convenience init(red:Int,green:Int,blue:Int){
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0,alpha: 1.0)
    }
    convenience init(rgb:Int){
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
extension UIView{
    func checkIfAutoLayout(){
        if frame == .zero{
            translatesAutoresizingMaskIntoConstraints = false

        }

    }
}
