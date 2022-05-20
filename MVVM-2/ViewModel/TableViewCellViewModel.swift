//
//  TableViewCellViewModel.swift
//  MVVM-2
//
//  Created by Andrey Kapitalov on 20.05.2022.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    
    private var profile: Profile
    
    var fullname: String {
        return profile.name + " " + profile.secondName
    }
    
    var age: String {
        return String(describing: profile.age)
    }
    
    init(profiel: Profile) {
        self.profile = profiel
    }
}
