//
//  ViewController.swift
//  SwiftDemo
//
//  Created by 陈国辉 on 2016/12/1.
//  Copyright © 2016年 guohui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        customBtn.layer.masksToBounds = false
        customBtn.layer.cornerRadius = 5.0
        customBtn.backgroundColor = UIColor.red
        
        
        let rightBtn = UIButton.init(type: UIButtonType.custom)
        rightBtn.frame = CGRect(x:10, y:0, width:50, height:30)
        rightBtn.setTitle("点击", for: UIControlState.normal)
        rightBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        let rightItem = UIBarButtonItem.init(customView: rightBtn)
        self.navigationItem.rightBarButtonItem = rightItem
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

