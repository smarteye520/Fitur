//
//  MainViewController.swift
//  Fitur10
//
//  Created by smarteye on 2/3/19.
//  Copyright © 2019 Nikon. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickPendidikan(_ sender: Any) {
        let insertVC = storyboard?.instantiateViewController(withIdentifier: String(describing: InsertData1ViewController.self)) as! InsertData1ViewController
        navigationController?.pushViewController(insertVC, animated: false)
    }
    
    @IBAction func onClickPGN(_ sender: Any) {
        let insertVC = storyboard?.instantiateViewController(withIdentifier: String(describing: InsertData2ViewController.self)) as! InsertData2ViewController
        navigationController?.pushViewController(insertVC, animated: false)
    }
    
    @IBAction func onClickTKI(_ sender: Any) {
        
        let insertVC = storyboard?.instantiateViewController(withIdentifier: String(describing: InsertData3ViewController.self)) as! InsertData3ViewController
        navigationController?.pushViewController(insertVC, animated: false)
    }

    @IBAction func onClickSAMSAT(_ sender: Any) {
        
        let insertVC = storyboard?.instantiateViewController(withIdentifier: String(describing: InsertData4ViewController.self)) as! InsertData4ViewController
        navigationController?.pushViewController(insertVC, animated: false)
    }
    
    @IBAction func onClickPertaminaLPG(_ sender: Any) {
        
        let insertVC = storyboard?.instantiateViewController(withIdentifier: String(describing: InsertData5ViewController.self)) as! InsertData5ViewController
        navigationController?.pushViewController(insertVC, animated: false)
    }
    
    @IBAction func onClickBniVcnOnline(_ sender: Any) {
        
        let insertVC = storyboard?.instantiateViewController(withIdentifier: String(describing: InsertData6ViewController.self)) as! InsertData6ViewController
        navigationController?.pushViewController(insertVC, animated: false)
    }

    @IBAction func onClickAktivasiLuarNegeri(_ sender: Any) {
        
        let insertVC = storyboard?.instantiateViewController(withIdentifier: String(describing: InsertData7ViewController.self)) as! InsertData7ViewController
        navigationController?.pushViewController(insertVC, animated: false)
    }

    @IBAction func PencairanDeposito(_ sender: Any) {
        
        let insertVC = storyboard?.instantiateViewController(withIdentifier: String(describing: Intro8ViewController.self)) as! Intro8ViewController
        navigationController?.pushViewController(insertVC, animated: false)
    }

}
