//
//  SelectableRowView.swift
//  StackViewCellHighlight
//
//  Created by masamichi on 2019/12/06.
//  Copyright © 2019 Masamichi Ueta. All rights reserved.
//

import UIKit

class SelectableRowView: UIView {

    private lazy var button: SelectableButton = {
        let button = SelectableButton()
        return button
    }()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true

        button.addTarget(self, action: #selector(touchDown(button:)), for: .touchDown)
        button.addTarget(self, action: #selector(cancel(button:)), for: .touchCancel)
        button.addTarget(self, action: #selector(handleTap(button:)), for: .touchUpInside)
    }

    var didTap: (() -> Void)?

    @objc private func handleTap(button: SelectableButton) {
        setSelected(true, animated: false)
        didTap?()
    }

     @objc private func touchDown(button: SelectableButton) {
        setSelected(true, animated: false)
    }

     @objc private func cancel(button: SelectableButton) {
        setSelected(false, animated: false)
    }

     func setSelected(_ selected: Bool, animated: Bool) {
        button.setSelected(selected, animated: animated)
    }
}
