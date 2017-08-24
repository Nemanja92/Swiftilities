//
//  ButtonsViewController.swift
//  Swiftilities
//
//  Created by Nicholas Bonatsakis on 5/15/17.
//  Copyright © 2017 Raizlabs. All rights reserved.
//

import Swiftilities
import UIKit

class ButtonsViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let rectButton = BetterButton(shape: .rectangle(cornerRadius: 10), style: .solid(backgroundColor: .purple, foregroundColor: .white))
        rectButton.setTitle("Rectangle (Solid)", for: .normal)
        stackView.addArrangedSubview(rectButton)
        rectButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        rectButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        rectButton.addTarget(self, action: #selector(toggleLoading), for: .touchUpInside)

        let pillOutline = BetterButton(shape: .pill, style: .outlineOnly(backgroundColor: .clear, foregroundColor: .black))
        pillOutline.setTitle("Pill (Outline-Only)", for: .normal)
        stackView.addArrangedSubview(pillOutline)
        pillOutline.widthAnchor.constraint(equalToConstant: 300).isActive = true
        pillOutline.heightAnchor.constraint(equalToConstant: 44).isActive = true

        let pillOutlineInvert = BetterButton(shape: .pill, style: .outlineInvert(backgroundColor: .white, foregroundColor: .green))
        pillOutlineInvert.setTitle("Pill (Outline-Invert)", for: .normal)
        stackView.addArrangedSubview(pillOutlineInvert)
        pillOutlineInvert.widthAnchor.constraint(equalToConstant: 300).isActive = true
        pillOutlineInvert.heightAnchor.constraint(equalToConstant: 44).isActive = true
        pillOutlineInvert.addTarget(self, action: #selector(toggleLoading), for: .touchUpInside)

        let getButton = BetterButton(shape: .rectangle(cornerRadius: 0), style: .outlineInvert(backgroundColor: .white, foregroundColor: .blue))
        getButton.setTitle("GET", for: .normal)
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        getButton.setContentCompressionResistancePriority(UILayoutPriority.required, for: .horizontal)
        getButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        stackView.addArrangedSubview(getButton)

        let circleOutlineInvert = BetterButton(shape: .circle, style: .outlineInvert(backgroundColor: .white, foregroundColor: .red))
        circleOutlineInvert.iconImage = #imageLiteral(resourceName: "icn-twitter")
        stackView.addArrangedSubview(circleOutlineInvert)
        circleOutlineInvert.widthAnchor.constraint(equalToConstant: 74).isActive = true
        circleOutlineInvert.heightAnchor.constraint(equalToConstant: 74).isActive = true
        circleOutlineInvert.addTarget(self, action: #selector(toggleLoading), for: .touchUpInside)
    }

    @objc func toggleLoading(button: BetterButton) {
        button.isLoading = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            button.isLoading = false
        }
    }
}
