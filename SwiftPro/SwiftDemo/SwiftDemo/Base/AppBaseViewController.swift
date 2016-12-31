//
//  AppBaseViewController.swift
//  SwiftDemo
//
//  Created by 陈国辉 on 2016/12/7.
//  Copyright © 2016年 guohui. All rights reserved.
//

import UIKit

class AppBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.automaticallyAdjustsScrollViewInsets = true;
        
        self.setBackBtn()

    }
    //////设置返回按钮
    func setBackBtn()
    {
        if self.navigationController?.viewControllers.count != 1
        {
            let leftBtn = UIButton(type: .custom)
            leftBtn.frame = CGRect(x: 0,y: 0,width: 20,height: 20)
            leftBtn.setImage(UIImage(named: "nav_back_n"), for: .normal)
            leftBtn.setImage(UIImage(named: "nav_back_n"), for: .selected)
            leftBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10)
            leftBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
        
        }
        
    }
    //////返回执行
    func backAction(snder: UIButton)
    {
       _ = self.navigationController?.popViewController(animated: true)
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
