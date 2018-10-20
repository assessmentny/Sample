//
//  NewsDetailViewController.swift
//  Test
//
//  Created by Hussain Chhatriwala on 18/10/18.
//  Copyright © 2018 Hussain.Chhatriwala. All rights reserved.
//

import UIKit
import WebKit

class NewsDetailViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    var newsHTMLurl: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadWebView()
        // Do any additional setup after loading the view.
    }
    
    func loadWebView() {
        let url = URL(string: newsHTMLurl)
        let requestObj = URLRequest(url: url! as URL)
        webView.load(requestObj)
        webView.allowsBackForwardNavigationGestures = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewsDetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        activityIndicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        activityIndicator.isHidden = true
    }
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        activityIndicator.isHidden = true
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        activityIndicator.isHidden = true
    }
}
