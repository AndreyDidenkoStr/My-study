//
//  CoursesViewController.swift
//  Networking Test App
//
//  Created by Andrey Kapitalov on 31.08.2022.
//

import UIKit

class CoursesViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
    }
    
    func fetchData() {
        let jsonUrlString = "https://swiftbook.ru//wp-content/uploads/api/api_missing_or_wrong_fields"
        
        
        guard let url = URL(string: jsonUrlString) else { return }
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                print(websiteDescription.courses)
            } catch let error {
                print(error)
            }

        }.resume()
        
    }


}
