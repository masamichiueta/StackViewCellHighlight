//
//  UIButtonCancelableScrollView.swift
//  StackViewCellHighlight
//
//  Created by masamichi on 2019/12/06.
//  Copyright © 2019 Masamichi Ueta. All rights reserved.
//

import UIKit

// https://stackoverflow.com/questions/3512563/scrollview-not-scrolling-when-dragging-on-buttons/3550157#3550157

class UIButtonCancelableScrollView: UIScrollView {

    override func touchesShouldCancel(in view: UIView) -> Bool {
        if view.isKind(of: UIButton.self) {
          return true
        }

        return super.touchesShouldCancel(in: view)
    }

}
