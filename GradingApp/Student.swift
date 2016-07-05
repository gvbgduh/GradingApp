//
//  Student.swift
//  GradingApp
//
//  Created by Георгий Богодухов on 5/07/2016.
//  Copyright © 2016 George Bogodukhov. All rights reserved.
//

import Foundation

class Student {
    var firstName = ""
    var lastName = ""
    var marks = []
    
    init(firstName:String, lastName:String, marks:[Mark]) {
        self.firstName = firstName
        self.lastName = lastName
        self.marks = marks
    }
}