//
//  ImageViewController.swift
//  Networking Test App
//
//  Created by Andrey Kapitalov on 30.08.2022.
//

import UIKit



class ImageViewController: UIViewController {

    private let url = "https://updatenaw.com/wp-content/uploads/2021/09/15-Best-Wallpapers-for-iPhone-13-Pro-13-Pro-Max-iPhone-13.jpg"
    
    @IBOutlet weak var imageView: UIImageView!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        Networkmanager.downloadImage(url: url) { (image) in
            self.imageView.image = image
        }
    }
    
    
}
