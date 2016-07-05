//
//  Mark.swift
//  GradingApp
//
//  Created by Георгий Богодухов on 5/07/2016.
//  Copyright © 2016 George Bogodukhov. All rights reserved.
//

import Foundation


class Mark {
    var subject = ""
    var mark = 0
    
    init(subject: String, mark: Int) {
        self.subject = subject
        self.mark = mark
    }
}