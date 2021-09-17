//
//  Success1ViewController.swift
//  Fitur10
//
//  Created by smarteye on 2/4/19.
//  Copyright © 2019 NiKon. All rights reserved.
//

import UIKit

class Success1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onClickbtnClose(_ sender: Any) {
        // Only use for Test
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickbtnDownload(_ sender: Any) {
        
    }
    
    @IBAction func onClickbtnShare(_ sender: Any) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}
