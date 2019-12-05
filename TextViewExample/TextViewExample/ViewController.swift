//
//  ViewController.swift
//  TextViewExample
//
//  Created by Faiz Ashraf on 12/5/19.
//  Copyright © 2019 Dharmendra. All rights reserved.
//

import UIKit
import DSTextView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v = DSTextView()
        v.frame = CGRect(x: 16, y: 200, width: view.bounds.width - 32, height: 300)
        
        v.placeholder = "Write something..."
        v.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        
        view.addSubview(v)
        
        // Do any additional setup after loading the view.
    }


}

