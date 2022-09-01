//
//  WebViewController.swift
//  Networking Test App
//
//  Created by Andrey Kapitalov on 31.08.2022.
//

import UIKit

class WebViewController: UIViewController {
    
    var courseName: String?
    var courseURL: String?
    
    @IBOutlet weak var webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: courseURL!) else { return }
        webview.loadRequest(URLRequest(url: url))
        
    }
    

}
