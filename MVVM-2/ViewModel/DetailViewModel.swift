//
//  DetailViewModel.swift
//  MVVM-2
//
//  Created by Andrey Kapitalov on 26.05.2022.
//

import Foundation

class DetailViewModel: DetailViewModelType {
    
    private var profile: Profile
    
    var description: String? {
        return String(describing: "\(profile.name) \(profile.secondName) is age \(profile.age) old")
    }
    
    init(profile: Profile) {
        self.profile = profile
    }
}
