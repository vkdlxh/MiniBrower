//
//  ViewController.swift
//  MiniBrowser
//
//  Created by 김태현 on 2017. 9. 1..
//  Copyright © 2017년 JSJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bookMarkSegmentedControl: UISegmentedControl!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var mainWebView: UIWebView!
    
    @IBAction func bookMarkAction(sender: AnyObject) {
        let bookMarkUrl = bookMarkSegmentedControl.titleForSegmentAtIndex(bookMarkSegmentedControl.selectedSegmentIndex)
        let urlString = "http://www.\(bookMarkUrl).com"
        mainWebView.loadRequest(NSURLRequest(URL: NSURL(string: urlString)!))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

