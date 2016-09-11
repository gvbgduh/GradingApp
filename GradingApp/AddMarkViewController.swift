//
//  AddMarkViewController.swift
//  GradingApp
//
//  Created by Георгий Богодухов on 8/07/2016.
//  Copyright © 2016 George Bogodukhov. All rights reserved.
//

import UIKit
import CoreData


class AddMarkViewController: UIViewController {
    
    var mark:Mark!
    var student:Student!
    
    @IBOutlet var subjectTextField:UITextField!
    @IBOutlet var markTextField:UITextField!
    
    @IBAction func addNewMark(segue:UIStoryboardSegue) {
        let subject = subjectTextField.text
//        let mark = markTextField.text
        
        let markValue = Int16(markTextField.text!)
        
        if subject == "" || markValue < 1 || markValue > 100  {
            let alertController = UIAlertController(title: "Wrong Input!", message: "Please provide correct input!", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
            return
        }
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            mark = NSEntityDescription.insertNewObjectForEntityForName("Mark", inManagedObjectContext: managedObjectContext) as! Mark
            mark.subject = subject!
            mark.mark = markValue!
            
            mark.student = student
            
            do {
                try managedObjectContext.save()
            } catch {
                print(error)
            }
        }
        navigationController!.popViewControllerAnimated(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
