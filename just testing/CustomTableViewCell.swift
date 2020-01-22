//
//  CustomTableViewCell.swift
//  just testing
//
//  Created by Rinalds Domanovs on 21/01/2020.
//  Copyright © 2020 Rinalds Domanovs. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    let stackView = UIStackView()
    let leftLabel = UILabel()
    let rightLabel = UILabel()
    var datePicker = UIDatePicker()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    func setupUI() {
        selectionStyle = .none

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        contentView.addSubview(stackView)

        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        leftLabel.text = "Starts"
        stackView.addArrangedSubview(leftLabel)

        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        rightLabel.text = "16:00"
        stackView.addArrangedSubview(rightLabel)

        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.timeZone = .current
        datePicker.locale = .current
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        contentView.addSubview(datePicker)

        setupConstraints()
    }

    func setupConstraints() {
        let constraints = [
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 50),

            datePicker.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            datePicker.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    @objc func dateChanged(_ sender: UIDatePicker) {
        let date = sender.date
        let calendar = Calendar.current

        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)

        rightLabel.text = "\(hour):\(minute)"
    }
}
