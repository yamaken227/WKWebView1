//
//  ViewController.swift
//  WKWebView1
//
//  Created by Kenta Yamada on 2021/03/25.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var webView = WKWebView()
        
    @IBOutlet weak var toorBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator.isHidden = true
        
        //大きさを決める
        
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - toorBar.frame.size.height)
        
        view.addSubview(webView)
        
        webView.navigationDelegate = self
        
        //URLをロード
        let url = URL(string: "https://www.kurashiru.com/")
        let request = URLRequest(url:url!)
        webView.load(request)
        
        indicator.layer.zPosition = 2
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        //ロードが完了した時に呼ばれるデリゲートメソッド
        indicator.isHidden = true
        indicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        //読み込みが開始した時に呼ばれるデリゲートメソッド
        indicator.isHidden = false
        indicator.startAnimating()
    }

    @IBAction func back(_ sender: Any) {
        
        webView.goBack()
        
    }
    
    @IBAction func go(_ sender: Any) {
        
        webView.goForward()
        
    }
    
    
}

