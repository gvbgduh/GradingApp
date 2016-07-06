//
//  Mark.swift
//  GradingApp
//
//  Created by Георгий Богодухов on 5/07/2016.
//  Copyright © 2016 George Bogodukhov. All rights reserved.
//

import Foundation
import CoreData


class Mark:NSManagedObject {
    @NSManaged var subject:String
    @NSManaged var mark:Int16
    
    @NSManaged var student:Student
}
