//
//  Intro8ViewController.swift
//  Fitur10
//
//  Created by smarteye on 2/3/19.
//  Copyright © 2019 Nikon. All rights reserved.
//

import UIKit

class Intro8ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickbtnClose(_ sender: Any) {
        // Only use for Test
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickSelanjutnya(_ sender: Any) {
        let insertVC = storyboard?.instantiateViewController(withIdentifier: String(describing: InsertData8ViewController.self)) as! InsertData8ViewController
        navigationController?.pushViewController(insertVC, animated: false)
    }

}
