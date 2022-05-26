//
//  ViewModel.swift
//  MVVM-2
//
//  Created by Andrey Kapitalov on 20.05.2022.
//

import Foundation



class ViewModel: tableViewViewModelType {
    
    private var selectedIndexPath: IndexPath?
    
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
        return TableViewCellViewModel(profile: profile)
    }
    
    func viewModelForSelectionRow() -> DetailViewModelType? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        return DetailViewModel(profile: profiles[selectedIndexPath.row])
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
}
