//
//  ViewModel.swift
//  MVVM-2
//
//  Created by Andrey Kapitalov on 20.05.2022.
//

import Foundation



class ViewModel: tableViewViewModelType {
    
    

    func nomberOfRows() -> Int { 
        return profiles.count
    }
     
  
    
    
    var profiles = [
        Profile(name: "John", secondName: "Smith", age:  33),
        Profile(name: "Max", secondName: "Kolby", age:  33),
        Profile(name: "Mark", secondName: "Salmon", age:  33)
    ]
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let profile = profiles[indexPath.row]
        return TableViewCellViewModel(profiel: profile)
    }
}
