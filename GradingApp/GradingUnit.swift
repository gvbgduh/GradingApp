//
//  GradingUnit.swift
//  GradingApp
//
//  Created by Георгий Богодухов on 6/07/2016.
//  Copyright © 2016 George Bogodukhov. All rights reserved.
//

import Foundation
import CoreData


class GradingUnit:NSManagedObject {
    @NSManaged var unitName: String
    
    @NSManaged var students: NSSet
    
    @NSManaged func addStudentsObject(student: Student)
    @NSManaged func removeStudentsObject(student: Student)
    @NSManaged func addStudents(students: NSSet)
    @NSManaged func removeStudents(students: NSSet)
}