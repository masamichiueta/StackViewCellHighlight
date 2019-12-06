//
//  SelectableButton.swift
//  StackViewCellHighlight
//
//  Created by masamichi on 2019/12/06.
//  Copyright © 2019 Masamichi Ueta. All rights reserved.
//

import UIKit

class SelectableButton: UIButton {

    override var isHighlighted: Bool {
        get {
            return super.isHighlighted
        }
        set {
            backgroundColor = (isSelected || newValue) ? UIColor.opaqueSeparator : UIColor.white
            super.isHighlighted = newValue
        }
    }

    func setSelected(_ selected: Bool, animated: Bool) {
        func update() {
            isSelected = selected
            backgroundColor = selected ? UIColor.opaqueSeparator : UIColor.white
        }
        if animated {
            UIView.animate(withDuration: 0.35, animations: update)
        } else {
            update()
        }
    }

}
