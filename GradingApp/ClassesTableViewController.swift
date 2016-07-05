//
//  ClassesTableViewController.swift
//  GradingApp
//
//  Created by Георгий Богодухов on 5/07/2016.
//  Copyright © 2016 George Bogodukhov. All rights reserved.
//

import UIKit

class ClassesTableViewController: UITableViewController {
    
    var classes = [
        GradingClass(
            name: "Class A",
            students: [
                Student(
                    firstName: "A",
                    lastName: "A",
                    marks: [
                        Mark(subject: "Math", mark: 100),
                        Mark(subject: "Phys", mark: 97),
                        Mark(subject: "English", mark: 70),
                    ]
                ),
                Student(
                    firstName: "B",
                    lastName: "A",
                    marks: [
                        Mark(subject: "Math", mark: 60),
                        Mark(subject: "Phys", mark: 57),
                        Mark(subject: "English", mark: 95),
                    ]
                ),
                Student(
                    firstName: "C",
                    lastName: "A",
                    marks: []
                )
            ]
        ),
        GradingClass(
            name: "Class B",
            students: [
                Student(
                    firstName: "A",
                    lastName: "B",
                    marks: []
                ),
                Student(
                    firstName: "B",
                    lastName: "B",
                    marks: []
                ),
                Student(
                    firstName: "C",
                    lastName: "B",
                    marks: []
                )
            ]
        ),
        GradingClass(
            name: "Class C",
            students: [
                Student(
                    firstName: "A",
                    lastName: "C",
                    marks: []
                ),
                Student(
                    firstName: "B",
                    lastName: "C",
                    marks: []
                )
            ]
        ),
        GradingClass(
            name: "Class D",
            students: []
        ),
        GradingClass(
            name: "Class F",
            students: []
        ),
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return classes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "ClassCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = classes[indexPath.row].name

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            classes.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showStudents" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! StudentsTableViewController
                destinationController.students = classes[indexPath.row].students as! [Student]
            }
        }
    }
}
