//
//  ViewController.swift
//  MTPopup
//
//  Created by marst123 on 01/27/2025.
//  Copyright (c) 2025 marst123. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func mtPopupAction(_ sender: Any) {
        self.navigationController?.pushVC(PopupViewController())
    }
}

