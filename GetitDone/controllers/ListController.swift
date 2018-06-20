//
//  ListController.swift
//  GetitDone
//
//  Created by Luis Romo on 06/06/18.
//  Copyright © 2018 Luis Romo. All rights reserved.
//

import UIKit
class ListController: UIViewController, GDHeaderDelegate, GDNewItemDelegate{

    func openAddItemPopup() {
        print("trying to open add item popup view")
    }

    func addItemToList(text: String) {
        print("text in textfield is \(text)")
    }

    let header = GDHeaderView(title: "Stuff to get done", subtitle: "4 Left")
    let popup = GDNewItemPopup()
    var keyboardHeight:CGFloat = 333

    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification: )), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
    }

    @objc func keyboardWillShow(notification:Notification) {
        let keyboardSize = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        self.keyboardHeight = keyboardSize.height
        print(self.keyboardHeight)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(header)
        view.addSubview(popup)
        
        NSLayoutConstraint.activate([
            header.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            header.heightAnchor.constraint(equalToConstant: 120),

            popup.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            popup.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            popup.rightAnchor.constraint(equalTo: view.rightAnchor, constant:-20),
            popup.heightAnchor.constraint(equalToConstant: 80)
            ])

        popup.textField.delegate = self
        popup.delegate = self
        header.delegate = self
    }
}

//TODO: Refactor shared method
extension ListController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        popup.animateView(transform: CGAffineTransform(translationX: 0, y: -keyboardHeight), duration: 0.5)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        popup.animateView(transform: CGAffineTransform(translationX: 0, y: 0), duration: 0.6)
    }
}
