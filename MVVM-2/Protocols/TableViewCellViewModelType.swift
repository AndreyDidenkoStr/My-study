//
//  TableViewCellViewModelType.swift
//  MVVM-2
//
//  Created by Andrey Kapitalov on 20.05.2022.
//

import Foundation

protocol TableViewCellViewModelType: class {
    var fullname: String { get }
    var age: String { get }
}
