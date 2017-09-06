//
//  ViewController.swift
//  MiniBrowser
//
//  Created by 김태현 on 2017. 9. 1..
//  Copyright © 2017년 JSJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate{

    @IBOutlet weak var bookMarkSegmentedControl: UISegmentedControl!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var mainWebView: UIWebView!
    @IBOutlet weak var spiningActivityIndicatorView: UIActivityIndicatorView!
    
    @IBAction func bookMarkAction(sender: AnyObject) {
        let bookMarkUrl = bookMarkSegmentedControl.titleForSegmentAtIndex(bookMarkSegmentedControl.selectedSegmentIndex)
        let urlString = "http://www.\(bookMarkUrl!).com"
        mainWebView.loadRequest(NSURLRequest(URL: NSURL(string: urlString)!))
        urlTextField.text = urlString
    }
    
    // 키패드 Go를 눌렀을 때 페이지 이동 처리 기능.
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        var urlString = "\(urlTextField.text!)"
        
        // hasPrefix : 앞 글자가 가지고 있는가
        if !urlString.hasPrefix("http://") {
            urlString = "http://\(urlTextField.text!)"
        }
        
        mainWebView.loadRequest(NSURLRequest(URL: NSURL(string: urlString)!))
        // 키보드가 자동으로 비활성화 되면서 내려감
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var urlString = "http://www.facebook.com"
        
        mainWebView.loadRequest(NSURLRequest(URL: NSURL(string: urlString)!))
        urlTextField.text = urlString
        
    }
    
    // WebView가 통신 시작할 때 이벤트
    func webViewDidStartLoad(webView: UIWebView) {
        spiningActivityIndicatorView.startAnimating()
    }
    // WebView가 통신 끝낼 때 이벤트
    func webViewDidFinishLoad(webView: UIWebView) {
        spiningActivityIndicatorView.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

