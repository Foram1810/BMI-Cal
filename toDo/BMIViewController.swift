//
//  BMIViewController.swift
//  toDo
//
//  Created by Diego  lopez on 2018-12-13.
//  Copyright © 2018 MAGNUMIUM. All rights reserved.
//

import UIKit

class BMIViewController: UIViewController {
    var inputName = String()

    @IBOutlet weak var name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(inputName)
        
        name.text = inputName

        // Do any additional setup after loading the view.
    }
    


}
