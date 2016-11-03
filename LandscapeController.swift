//
//  LandscapeController.swift
//  RotationDome
//
//  Created by apple on 16/10/21.
//  Copyright © 2016年 Adversity. All rights reserved.
//

import UIKit

class LandscapeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "横屏"
        self.view.backgroundColor = UIColor.grayColor()

        
        // button 这里为了适应旋转使用自动布局
        let button = UIButton()
        button.backgroundColor = UIColor.blackColor()
        button.setTitle("返回", forState:.Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.addTarget(self, action: #selector(on_backButton_click), forControlEvents: .TouchUpInside)
        button.layer.cornerRadius = 50.0
        button.layer.masksToBounds = true
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        let layoutCenterX = NSLayoutConstraint(item: button, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1, constant: 20)
        let layoutCenterY = NSLayoutConstraint(item: button, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier:1, constant: 20)
        let height = NSLayoutConstraint(item: button, attribute:.Height , relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 0, constant: 100)
        let width = NSLayoutConstraint(item: button, attribute:.Width , relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 0, constant: 100)
       button.superview!.addConstraints([height,width,layoutCenterX,layoutCenterY])
        

        
        
            }
    
    func on_backButton_click() -> () {
     
        if  ( sIsPush as NSString ).boolValue == true {
            self.navigationController?.popViewControllerAnimated(false)
        }else{
            self.dismissViewControllerAnimated(false, completion: {
                
            })
        }
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        
        if  ( sIsPush as NSString ).boolValue == true  {
            if(!UIDeviceOrientationIsLandscape(UIDevice.currentDevice().orientation)) {
                UIDevice.currentDevice().setValue(UIInterfaceOrientation.LandscapeLeft.rawValue, forKey: "orientation")
            }
        }
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [.LandscapeLeft , .LandscapeRight]
    }
    
    
    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return .LandscapeRight
    }
    
    override func prefersStatusBarHidden() -> Bool {
        
        let isShow = (sIsShowStatusBar as NSString).boolValue
        return !isShow
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
