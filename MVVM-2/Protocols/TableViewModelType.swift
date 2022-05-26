//
//  TableViewModelType.swift
//  MVVM-2
//
//  Created by Andrey Kapitalov on 20.05.2022.
//

import Foundation

protocol tableViewViewModelType {
    func nomberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType?
    
    func viewModelForSelectionRow() -> DetailViewModelType?
    func selectRow(atIndexPath indexPath: IndexPath)
}
