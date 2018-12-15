//
//  Record.swift
//  toDo
//
//  Created by Shubh Patel on 2018-12-14.
//  Copyright © 2018 MAGNUMIUM. All rights reserved.
//

import Foundation


import RealmSwift

class Record: Object{
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    @objc dynamic var height = 0.0
    @objc dynamic var weight = 0.0
    @objc dynamic var bmi = 0.0
    
//    init(name: String?, age: Int?, height: Double?, weight: Double, bmi: Double?) {
//        self.name = name!
//        self.age = age!
//        self.height = height!
//        self.weight = weight
//        self.bmi = bmi!
//    }
}
