//
//  ListViewController.swift
//  BMI_Final_Exam
//
//  Created by Diego  lopez on 2018-12-13.
//  Copyright © 2018 Diego_Lopez. All rights reserved.
//

import UIKit


var list = ["Pedro","Edilberto"]


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tmp: String = String()

    
    @IBOutlet weak var myTableView: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (list.count)
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return(cell)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            list.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "BMI", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController]
        //Pass the selected obiect to the new view controller
        
          //let tableViewCell = sender as! UITableViewCell
          //let indexPath  = myTableView.indexPath(for: tableViewCell)!
          //let user = list[indexPath.row]
        
        let newVC = segue.destination as! BMIViewController
        print("TEST ", list[1])
        
        newVC.inputName = list[1]
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
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

