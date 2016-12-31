//
//  DetailViewController.swift
//  SwiftDemo
//
//  Created by 陈国辉 on 2016/12/7.
//  Copyright © 2016年 guohui. All rights reserved.
//

import UIKit

typealias fucBlock = (_ backMsg: String) ->()   //定义block回调
protocol MyDelegate{                            //定义代理回调
    func didSomething(name:String)
}
class DetailViewController: AppBaseViewController {

    @IBOutlet weak var backBtn: UIButton!
    var blockproerty:fucBlock!               //定义block属性
    var mDelegate:MyDelegate?                //定义代理属性
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

        
    }

    @IBAction func backAction(_ sender: UIButton) {
        
        mDelegate?.didSomething(name: "小明")
        blockproerty!("OK")
        _ = self.navigationController?.popViewController(animated: true)
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
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
