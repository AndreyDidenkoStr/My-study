//
//  NetworkManager.swift
//  Networking Test App
//
//  Created by Andrey Kapitalov on 04.09.2022.
//

import Foundation
import UIKit

class Networkmanager {
    
    
    static func getResponse(url: String) {
        print("get")
        guard let url = URL(string: url) else { return }
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
    
    static func postRquest(url: String) {
        guard let url = URL(string: url) else { return }
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
    
    static func downloadImage(url: String, completion: @escaping (_ image: UIImage)->()) {
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    print("fuck")
                    completion(image)
                }
            }
        }.resume()
    }
    
    static func fetchData(url: String, comletion: @escaping (_ courses: [Course])->()) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let courses = try decoder.decode([Course].self, from: data)
                comletion(courses)
            } catch let error {
                print(error)
            }

        }.resume()
    }
}
