//
//  ViewController.swift
//  StackViewCellHighlight
//
//  Created by masamichi on 2019/12/06.
//  Copyright © 2019 Masamichi Ueta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cell1: SelectableCellView!
    @IBOutlet weak var cell2: SelectableCellView!
    @IBOutlet weak var cell3: SelectableCellView!
    @IBOutlet weak var cell4: SelectableCellView!
    @IBOutlet weak var cell5: SelectableCellView!

    var selectedCell: SelectableCellView?
    var clearsSelectionOnViewWillAppear: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        [cell1, cell2, cell3, cell4, cell5].forEach { cell in
            cell?.didTap = { [weak self] in
                guard let self = self else { return }
                self.selectedCell = cell
                self.performSegue(withIdentifier: "show", sender: nil)
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedCell = selectedCell, clearsSelectionOnViewWillAppear {
            transitionCoordinator?.animate(alongsideTransition: { _ in
                selectedCell.setSelected(false, animated: animated)
            }, completion: { context in
                if context.isCancelled {
                    selectedCell.setSelected(true, animated: false)
                } else {
                    self.selectedCell = nil
                }
            })
        }
    }
}

