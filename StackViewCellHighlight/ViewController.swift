//
//  ViewController.swift
//  StackViewCellHighlight
//
//  Created by masamichi on 2019/12/06.
//  Copyright © 2019 Masamichi Ueta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var row1: SelectableRowView!
    @IBOutlet weak var row2: SelectableRowView!
    @IBOutlet weak var row3: SelectableRowView!
    @IBOutlet weak var row4: SelectableRowView!
    @IBOutlet weak var row5: SelectableRowView!

    var selectedRow: SelectableRowView?
    var clearsSelectionOnViewWillAppear: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        [row1, row2, row3, row4, row5].forEach { row in
            row?.didTap = { [weak self] in
                guard let self = self else { return }
                self.selectedRow = row
                self.performSegue(withIdentifier: "show", sender: nil)
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedRow = selectedRow, clearsSelectionOnViewWillAppear {
            transitionCoordinator?.animate(alongsideTransition: { _ in
                selectedRow.setSelected(false, animated: animated)
            }, completion: { context in
                if context.isCancelled {
                    selectedRow.setSelected(true, animated: false)
                } else {
                    self.selectedRow = nil
                }
            })
        }
    }
}

