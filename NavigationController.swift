//
//  NavigationController.swift
//  RotationDome
//
//  Created by apple on 16/10/21.
//  Copyright © 2016年 Adversity. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
       if ((self.topViewController?.respondsToSelector(#selector(shouldAutorotate))) != nil) {
            return (self.topViewController?.shouldAutorotate())!
        }
        return false
    }
    
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        
        if ((self.topViewController?.respondsToSelector(#selector(supportedInterfaceOrientations))) != nil) {
            return (self.topViewController?.supportedInterfaceOrientations())!
        }
        return super.supportedInterfaceOrientations()
    }
    
    
    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        
        if ((self.topViewController?.respondsToSelector(#selector(preferredInterfaceOrientationForPresentation))) != nil) {
            return (self.topViewController?.preferredInterfaceOrientationForPresentation())!
        }
        return super.preferredInterfaceOrientationForPresentation()
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
