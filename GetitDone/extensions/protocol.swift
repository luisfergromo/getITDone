//
//  delegate.swift
//  GetitDone
//
//  Created by Luis Romo on 07/06/18.
//  Copyright © 2018 Luis Romo. All rights reserved.
//

import Foundation
protocol GDHeaderDelegate {
    func openAddItemPopup()
}
protocol GDNewItemDelegate {
    func addItemToList()
}
