//
//  AddClassViewController.swift
//  GradingApp
//
//  Created by Георгий Богодухов on 6/07/2016.
//  Copyright © 2016 George Bogodukhov. All rights reserved.
//

import UIKit
import CoreData


class AddClassViewController: UIViewController {
    
    var gradingUnit:GradingUnit!
    
    @IBOutlet var classNameTextField:UITextField!
    
    @IBAction func saveNewClass(segue:UIStoryboardSegue) {
        let unitName = classNameTextField.text
        // Simple validation
        if unitName == "" {
            let alertController = UIAlertController(title: "Wrong Input", message: "Please enter the name of a new Class", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
            return
        }

        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            gradingUnit = NSEntityDescription.insertNewObjectForEntityForName("GradingUnit", inManagedObjectContext: managedObjectContext) as! GradingUnit
            gradingUnit.unitName = unitName!
            
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
