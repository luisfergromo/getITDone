//
//  optionset.swift
//  GetitDone
//
//  Created by Luis Romo on 07/06/18.
//  Copyright © 2018 Luis Romo. All rights reserved.
//

import Foundation

struct ButtonOptions: OptionSet {
    let rawValue: Int

    static let roundBtn    = ButtonOptions(rawValue: 1 << 0)
    static let squareBtn     = ButtonOptions(rawValue: 1 << 1)
//    static let priority   = ButtonOptions(rawValue: 1 << 2)
//    static let standard   = ButtonOptions(rawValue: 1 << 3)
//    static let express: ShippingOptions = [.nextDay, .secondDay]
//    static let all: ShippingOptions = [.express, .priority, .standard]
}
