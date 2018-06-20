//
//  NewItemPopup.swift
//  GetitDone
//
//  Created by Luis Romo on 08/06/18.
//  Copyright © 2018 Luis Romo. All rights reserved.
//

import UIKit
class GDNewItemPopup: GDGradient {
    //MARK: https://www.raizlabs.com/dev/2017/01/fixing-controls-scroll-views-ios/
    let cancel = GDButton(title: "  cancel  ", type: .roundBtn, radius: 4)
    let add = GDButton(title: "  add  ", type: .roundBtn, radius: 4)
    let textFiel = GDTextField(placeholder: "go buy Ikea frames", inset: 6)
    var delegate: GDNewItemDelegate?

    @objc func handleCancel(){
        print("Cancel btn has been pushed")
    }
    @objc func handleAdd(){
        print("Add btn has been pushed")
        if let delegate = self.delegate{
            delegate.addItemToList()
        }
    }


    override init(frame: CGRect = .zero) {
        super.init(frame: frame)

        let inset: CGFloat = 12
        self.layer.cornerRadius = 14


        addSubview(cancel)
        addSubview(add)
        addSubview(textFiel)

        NSLayoutConstraint.activate([
            cancel.leftAnchor.constraint(equalTo: leftAnchor, constant: inset),
            cancel.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            cancel.heightAnchor.constraint(equalToConstant: 24),

            add.rightAnchor.constraint(equalTo: rightAnchor, constant: -inset),
            add.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            add.heightAnchor.constraint(equalToConstant: 24),

            textFiel.leftAnchor.constraint(equalTo: leftAnchor, constant: inset),
            textFiel.rightAnchor.constraint(equalTo: rightAnchor, constant: -inset),
            textFiel.heightAnchor.constraint(equalToConstant: 25),
            textFiel.topAnchor.constraint(equalTo: add.bottomAnchor, constant: 3)
            ])

        cancel.addTarget(self, action: #selector(self.handleCancel), for: .touchUpInside)
        add.addTarget(self, action: #selector(self.handleAdd), for: .touchUpInside)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
