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
    
    @IBAction func postRquest(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        let userData = ["Course": "Networking", "Lesson": "Get and Post Request"]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        guard let hhtpBody = try? JSONSerialization.data(withJSONObject: userData, options: []) else { return }
        request.httpBody = hhtpBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let response = response, let data = data else { return }
            
            print(response)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
        }.resume()
    }
}

