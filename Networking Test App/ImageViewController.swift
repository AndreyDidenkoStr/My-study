//
//  ImageViewController.swift
//  Networking Test App
//
//  Created by Andrey Kapitalov on 30.08.2022.
//

import UIKit

class ImageViewController: UIViewController {

  
    @IBOutlet weak var imageView: UIImageView!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        getImage()
    }
    
    func getImage() {
        guard let url = URL(string:
                                "https://updatenaw.com/wp-content/uploads/2021/09/15-Best-Wallpapers-for-iPhone-13-Pro-13-Pro-Max-iPhone-13.jpg") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    print("fuck")
                    self.imageView.image = image
                }
            }
        }.resume()
    }
 

}
