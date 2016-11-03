//
//  SettingController.swift
//  RotationDome
//
//  Created by apple on 16/10/31.
//  Copyright © 2016年 Adversity. All rights reserved.
//

import UIKit

class SettingController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var tableView = UITableView()
    let dataArray = ["push切换","显示statusBar"]
    let switchArray = [sIsPush,sIsShowStatusBar]
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.title = "设置"
        
        // Do any additional setup after loading the view.
        tableView = UITableView.init(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), style: .Grouped)
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        
        if cell == nil {
            cell = UITableViewCell.init(style: .Default, reuseIdentifier: "cell")
            cell?.textLabel?.text = dataArray[indexPath.row]
        }
        
        let switchBar = UISwitch.init()
        cell?.accessoryView = switchBar
        switchBar.tag = indexPath.row  + 100
        switchBar.addTarget(self, action: #selector(on_switch_valueChanged), forControlEvents: .ValueChanged)
        switchBar.on =  (switchArray[indexPath.row] as NSString).boolValue
        
        return cell!
        
        
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    
    // MARK: - UISwitch
    func on_switch_valueChanged( senderh: AnyObject ) -> () {
        
        let switchBar = senderh as! UISwitch
        
        switch (switchBar.tag - 100) {
        case 0:
            
            
            sIsPush = String(switchBar.on)
            
            break
            
        case 1:
            
            sIsShowStatusBar = String(switchBar.on)
            
            break
            
        default:
             break
        }
        
        
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
