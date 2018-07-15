//
//  WebViewController.swift
//  IPrep
//
//  Created by Satish Kancherla on 7/5/18.
//  Copyright © 2018 Satish Kumar R Kancherla. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: UIViewController {
    
    var link = ""
    private var webView: WKWebView?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: link) {
            let req = URLRequest(url: url)
            webView?.load(req)
        }
    }
}
