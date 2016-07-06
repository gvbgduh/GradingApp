//
//  Student.swift
//  GradingApp
//
//  Created by Георгий Богодухов on 5/07/2016.
//  Copyright © 2016 George Bogodukhov. All rights reserved.
//

import Foundation
import CoreData


class Student:NSManagedObject {
    @NSManaged var firstName:String
    @NSManaged var lastName:String
    
    @NSManaged var gradingUnit:GradingUnit
    
    @NSManaged var marks:NSSet
    
    @NSManaged func addMarksObject(mark: Mark)
    @NSManaged func removeMarksObject(mark: Mark)
    @NSManaged func addMarks(marks: NSSet)
    @NSManaged func removeMarks(marks: NSSet)
}

