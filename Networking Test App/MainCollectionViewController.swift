//
//  MainCollectionViewController.swift
//  Networking Test App
//
//  Created by Andrey Kapitalov on 01.09.2022.
//

import UIKit

enum  Actions: String, CaseIterable {
    case downloadImage = "Download Image"
    case get = "GET"
    case post = "POST"
    case ourCourses = "Our Courses"
    case uploadImage = "Upload Image"
}

private let reuseIdentifier = "Cell"
private let url = "https://jsonplaceholder.typicode.com/posts"

class MainCollectionViewController: UICollectionViewController {
    
    let actions = Actions.allCases
    

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return actions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        cell.label.text = actions[indexPath.row].rawValue
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let action = actions[indexPath.row]
        
        switch action {
        case .downloadImage:
            performSegue(withIdentifier: "showImage", sender: self)
        case .get:
            Networkmanager.getResponse(url: url)
        case .post:
            Networkmanager.postRquest(url: url)
        case .ourCourses:
            performSegue(withIdentifier: "ourCourses", sender: self)
        case .uploadImage:
            print("Upload Image")
        }
    }
}
