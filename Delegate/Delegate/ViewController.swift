//
//  ViewController.swift
//  Delegate
//
//  Created by Park Vladislav on 14.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func openModalView(_ sender: Any) {
        let modalview = storyboard?.instantiateViewController(withIdentifier: "ModalViewController") as! ModalViewController
        modalview.categoryArray = ["Food", "Electronic"]
        present ( modalview, animated: true, completion: nil)
        
        modalview.modalPresentationStyle = .overCurrentContext
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}

