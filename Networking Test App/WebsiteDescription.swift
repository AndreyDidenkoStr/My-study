//
//  WebSiteDescription.swift
//  Networking Test App
//
//  Created by Andrey Kapitalov on 01.09.2022.
//

import Foundation

struct WebsiteDescription: Decodable {
    
    let websiteDescription: String?
    let websiteName: String?
    let courses: [Course]
}
