//
//  Course.swift
//  Networking Test App
//
//  Created by Andrey Kapitalov on 01.09.2022.
//

import Foundation

struct Course: Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let number_of_lessons: Int?
    let number_of_tests: Int?
    let imageUrl: String?
}
