//
//  AppNavigationController.swift
//  SwiftDemo
//
//  Created by 陈国辉 on 2016/12/7.
//  Copyright © 2016年 guohui. All rights reserved.
//

import UIKit

class AppNavigationController: UINavigationController,UIGestureRecognizerDelegate,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
        weak var weakSelf = self
        if self.responds(to: #selector(getter: interactivePopGestureRecognizer)) {
            self.interactivePopGestureRecognizer?.delegate = weakSelf
        }
        
        self.setNavigationStyle()
    }
    //设置nav的title颜色
    func setNavigationStyle()
    {
        let attribute = [NSFontAttributeName:UIFont.boldSystemFont(ofSize: 18),
                         NSForegroundColorAttributeName: UIColor.white
                        ]
        
        self.navigationBar.titleTextAttributes = attribute;
        self.navigationBar.barTintColor = UIColor(red: 67/255.0, green: 164/255.0, blue: 233/255.0, alpha: 1.0)
        
//        self.navigationBar.setBackgroundImage(UIImage(named: ""), for: .default)
    }
    
    //返回动画的时候，禁用侧滑返回手势
    override func pushViewController(_ viewController: UIViewController, animated: Bool)
    {
        self.view.endEditing(true)
        if self.responds(to: #selector(getter: interactivePopGestureRecognizer)) {
            self.interactivePopGestureRecognizer?.isEnabled = false
        }
        //大于一级  自动隐藏tabbar
        if (self.viewControllers.count > 0) {
            viewController.hidesBottomBarWhenPushed = true;
        }
        super.pushViewController(viewController, animated: true)
    }
    
    //视图push完成以后，恢复使用侧滑手势
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        let topVC:UIViewController = self.viewControllers[0]
        if topVC==viewController {
            navigationController.interactivePopGestureRecognizer?.isEnabled = false;
        }else
        {
            if self.responds(to: #selector(getter: interactivePopGestureRecognizer)) {
                self.interactivePopGestureRecognizer?.isEnabled = true
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
