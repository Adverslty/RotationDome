//
//  ViewController.swift
//  RotationDome
//
//  Created by apple on 16/10/21.
//  Copyright © 2016年 Adversity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "竖屏"
        self.view.backgroundColor = UIColor.whiteColor()
        
        // button
        let button = UIButton.init(frame: CGRectMake( SCREEN_WIDTH / 2 - 50 , SCREEN_HEIGHT / 2 - 50, 100, 100))
        button.backgroundColor = UIColor.blackColor()
        button.setTitle("旋转", forState:.Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.addTarget(self, action: #selector(on_rotationButton_click), forControlEvents: .TouchUpInside)
        button.layer.cornerRadius = 50.0
        button.layer.masksToBounds = true
        self.view.addSubview(button)
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "设置", style: .Plain, target: self, action: #selector(on_rightButton_click))
        
        
    }
    
    func on_rightButton_click() -> () {
        
        self.navigationController?.pushViewController(SettingController(), animated: false)
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        if  ( sIsPush as NSString ).boolValue == true {
            if(!UIDeviceOrientationIsPortrait(UIDevice.currentDevice().orientation)) {
                UIDevice.currentDevice().setValue(UIInterfaceOrientation.Portrait.rawValue, forKey: "orientation")
            }
            
        }
    }


    
    
    func on_rotationButton_click() -> () {
        
        if  ( sIsPush as NSString ).boolValue == true  {
            self.navigationController?.pushViewController(LandscapeController(), animated: false)
        }else{
            self.navigationController?.presentViewController(LandscapeController(), animated: false, completion: { 
                
            })
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .Portrait
    }
    
    
    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return .Portrait
    }
    


}

