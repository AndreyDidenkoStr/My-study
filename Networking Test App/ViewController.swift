//
//  ViewController.swift
//  Networking Test App
//
//  Created by Andrey Kapitalov on 30.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func getResponse(_ sender: Any) {
        print("get")
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, let response = response else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
            
            
            
        }.resume()
    }
    
    @IBAction func postResponse(_ sender: Any) {
        
    }
}

