//
//  ListViewController.swift
//  BMI_Final_Exam
//
//  Created by Diego  lopez on 2018-12-13.
//  Copyright © 2018 Diego_Lopez. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class SecondViewController: UIViewController {
    
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var bmi: UILabel!

    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var name: UITextField!
    
    var item: Record? = Record()
    var isSaved: Bool = false
    
    var realm: Realm!
    
    // Add the user to the list
    @IBAction func addItem(_ sender: AnyObject)
    {
        
        calcBMI()
        
        let record = Record(value: ["name": name.text, "age": (age.text! as NSString).intValue, "height": (height.text! as NSString).doubleValue, "weight": (weight.text! as NSString).doubleValue, "bmi": (bmi.text! as NSString).doubleValue])
        if isSaved
        {edit(record: record)}
        else
        {add(record: record)}

        
    }
    
    @IBAction func calculate(_ sender: AnyObject)
    {
       
        calcBMI()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()
        
        if(isSaved){
            name.text = try! item?.name
            age.text = try!  item?.age.description
            height.text = try! item?.height.description
            weight.text = try! item?.weight.description
            bmi.text = try! item?.bmi.description
        }
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func add(record: Record) {
        
        try! self.realm.write {
            self.realm.add(record)
        }
        
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    func edit(record: Record) {
        
        try! self.realm.write {
            self.realm.delete(self.item!)
            self.realm.add(record)
        }
        
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    func calcBMI() -> Double {
        let h = (height.text! as NSString).doubleValue
        let w = (weight.text! as NSString).doubleValue
        
        guard let bm: Double = (w/(h*h)) else {
            bmi.text = "0"
            return 0
        }
        bmi.text = try! bm.description
        return bm
    }


}

