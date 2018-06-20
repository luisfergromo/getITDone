//
//  ViewController.swift
//  GetitDone
//
//  Created by Luis Romo on 02/06/18.
//  Copyright © 2018 Luis Romo. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController {

    let bg:UIView={
        let view = GDGradient()
        view.layer.cornerRadius = 24
        return view
    }()

    let titleLabel = GDLabel(title: "GET IT DONE", size: 24, textAlign: .center)

    let infoLabel:UILabel = {
        let label =  GDLabel(title: "WELCOME. GET IT DONE IS A TODO LIST.\nA REALY DOPE TO-DO LIST.", size: 14, textAlign: .center)
        label.numberOfLines = 2
        return label
    }()

    let nextButton = GDButton(title: "Start", type: .roundBtn)

    let copyright = GDLabel(title: "ⓒ 2018 | This App Builder.", color: .grayOne, size: 14, textAlign: .center)

    @objc func handleNext(){
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.nextButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }) { (_) in
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.nextButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            }){ (_) in
                self.present(ListController(), animated: true, completion: nil)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.addTarget(self, action: #selector(self.handleNext), for: .touchUpInside)

        view.backgroundColor = .white
        view.addSubview(bg)
        bg.addSubview(titleLabel)
        bg.addSubview(infoLabel)
        view.addSubview(nextButton)
        bg.addSubview(copyright)

        NSLayoutConstraint.activate([
            bg.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            bg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            bg.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            bg.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),

            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: bg.topAnchor, constant: 60),

            infoLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor),
            infoLabel.centerYAnchor.constraint(equalTo: bg.centerYAnchor),
            infoLabel.widthAnchor.constraint(equalToConstant: 300),
            infoLabel.heightAnchor.constraint(equalToConstant: 40),

            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            nextButton.centerXAnchor.constraint(equalTo: bg.centerXAnchor),
            nextButton.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: -60),

            copyright.widthAnchor.constraint(equalToConstant: 200),
            copyright.heightAnchor.constraint(equalToConstant: 40),
            copyright.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            copyright.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5)


            ])
    }
}

