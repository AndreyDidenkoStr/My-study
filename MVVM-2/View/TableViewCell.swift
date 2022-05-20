//
//  TableViewCell.swift
//  MVVM-2
//
//  Created by Andrey Kapitalov on 20.05.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            fullNameLabel.text = viewModel.fullname
            ageLabel.text = viewModel.age
        }
    }
}
