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

    func addItemToList() {
        print("trying to add item to the list")
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

//        popup.transform = CGAffineTransform(translationX: 0, y: -self.keyboardHeight)

//        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.85, initialSpringVelocity: 2, options: .curveEaseIn, animations:{
//            self.popup.transform = CGAffineTransform(translationX: 0, y: -self.keyboardHeight)
//        }, completion: nil)
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

        popup.textFiel.delegate = self
        // as? UITextFieldDelegate
        popup.delegate = self

        header.delegate = self
    }
}
extension ListController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {

        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.85, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
            self.popup.transform = CGAffineTransform(translationX: 0, y: -self.keyboardHeight)
        }, completion: nil)
    }
}
