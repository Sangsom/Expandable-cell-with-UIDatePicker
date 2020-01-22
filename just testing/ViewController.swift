//
//  ViewController.swift
//  just testing
//
//  Created by Rinalds Domanovs on 20/01/2020.
//  Copyright © 2020 Rinalds Domanovs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var startDateCellExpanded: Bool = false

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self

        tableView.tableFooterView = UIView()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "StartCell")
    }

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StartCell") as! CustomTableViewCell
            cell.datePicker.isHidden = !startDateCellExpanded
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            if startDateCellExpanded {
                return 250
            } else {
                return 50
            }
        }

        return 50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let cell = tableView.cellForRow(at: indexPath) as! CustomTableViewCell
            startDateCellExpanded.toggle()

            tableView.beginUpdates()
            cell.datePicker.toggleIsHidden(!startDateCellExpanded, animated: true)
            tableView.endUpdates()
        }
    }
}

extension ViewController: UITableViewDelegate {

}

extension UIView {

    func toggleIsHidden(_ hidden: Bool, animated: Bool) {
        let duration: Double = 0.3

        if animated {
            if self.isHidden && !hidden {
                self.alpha = 0.0
                self.isHidden = false
            }

            UIView.animate(withDuration: duration, animations: {
                self.alpha = hidden ? 0.0 : 1.0
            }) { (complete) in
                self.isHidden = hidden
            }
        } else {
            self.isHidden = hidden
        }
    }

}
