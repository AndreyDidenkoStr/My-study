//
//  DetailViewModelType.swift
//  MVVM-2
//
//  Created by Andrey Kapitalov on 26.05.2022.
//

import Foundation

protocol DetailViewModelType {
    var description: String? { get }
    var age: Box<String?> { get }
    
}
