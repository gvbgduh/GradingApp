//
//  MarksTableViewController.swift
//  GradingApp
//
//  Created by Георгий Богодухов on 5/07/2016.
//  Copyright © 2016 George Bogodukhov. All rights reserved.
//

import UIKit
import CoreData


class MarksTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var marks:[Mark] = []
    
    var student:Student!
    
    var studentName = ""
    
    @IBAction func unwindToHomeScreen(segue:UIStoryboardSegue) {}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        title = "Student: \(student.firstName) \(student.lastName)"
        
        marks = student.marks.allObjects as! [Mark]
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
        return marks.count
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        marks = student.marks.allObjects as! [Mark]
        tableView.reloadData()
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MarkCell", forIndexPath: indexPath)

        // Configure the cell...
        let mark = marks[indexPath.row]
        cell.textLabel?.text = "\(mark.subject): \(mark.mark)"

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
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
            if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
                managedObjectContext.deleteObject(marks[indexPath.row])
                marks.removeAtIndex(indexPath.row)
                
                do {
                    try managedObjectContext.save()
                } catch {
                    print(error)
                }
            }
            
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
        if segue.identifier == "addMark" {
            let destinationController = segue.destinationViewController as! AddMarkViewController
            destinationController.student = student
        }
    }

}
