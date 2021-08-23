//
//  PrefectureTableViewCell.swift
//  Kadai10-MVVM
//
//  Created by 今村京平 on 2021/08/23.
//

import UIKit

class PrefectureTableViewCell: UITableViewCell {

    static var identifier: String { return String(describing: self) }
    static var nib: UINib { UINib(nibName: PrefectureTableViewCell.identifier, bundle: nil) }

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!

    func configure(title: String, detail: String) {
        titleLabel.text = title
        detailLabel.text = detail
    }
}
