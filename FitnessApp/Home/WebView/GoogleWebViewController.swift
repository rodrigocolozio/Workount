//
//  GoogleWebViewController.swift
//  FitnessApp
//
//  Created by Rodrigo Colozio on 24/05/23.
//

import Foundation
import UIKit
import WebKit

class GoogleWebViewController: UIViewController, WKNavigationDelegate {
    
    
    let webView = WKWebView()
    
    override func loadView() {
        webView.navigationDelegate = self
        view = webView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureWebView()
    }
    
    func configureWebView() {
        let url = URL(string: "https://www.google.com/imghp")
        webView.load(URLRequest(url: url!))
        webView.allowsBackForwardNavigationGestures = true
    }
}

