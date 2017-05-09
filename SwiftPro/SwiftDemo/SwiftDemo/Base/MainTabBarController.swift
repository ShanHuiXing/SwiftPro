//
//  MainTabBarController.swift
//  SwiftDemo
//
//  Created by 陈国辉 on 2016/12/6.
//  Copyright © 2016年 guohui. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let kTabFirstImageN = "btn_feilei_n";
    let kTabFirstImageP = "ic_office_p";
    
    let kTabSecondImageN = "btn_gouwudai_n";
    let kTabSecondImageP = "ic_new_p";
    
    let kTabThirdImageN = "btn_pinpai_n";
    let kTabThirdImageP = "ic_contact_p";
    
    let kTabFourImageN = "btn_shouye_n";
    let kTabFourImageP = "ic_user_p";
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.creatSubViewConstroller()
        
    }
    //添加tabBar上的控制器
    func creatSubViewConstroller() {
        
        let homeVC = HomeViewController();
        let fistNav = AppNavigationController(rootViewController: homeVC)
        fistNav.tabBarItem.title = "首页"
        fistNav.tabBarItem.image = UIImage(named: kTabFirstImageN)
        fistNav.tabBarItem.selectedImage = UIImage(named: kTabFirstImageP)
        self.addChildViewController(fistNav)
        
        let newsListVC = NewsListViewController();
        let secondNav = AppNavigationController(rootViewController: newsListVC)
        secondNav.tabBarItem.title = "消息"
        secondNav.tabBarItem.image = UIImage(named: kTabSecondImageN)
        secondNav.tabBarItem.selectedImage = UIImage(named: kTabSecondImageP)
        self.addChildViewController(secondNav)
        
        let scienceVC = ScienceViewController()
        let thirdNav = AppNavigationController(rootViewController: scienceVC)
        thirdNav.tabBarItem.title = "专区"
        thirdNav.tabBarItem.image = UIImage(named: kTabThirdImageN)
        thirdNav.tabBarItem.selectedImage = UIImage(named: kTabThirdImageP)
        self.addChildViewController(thirdNav)
        
        let myCenter = MyCenterViewController()
        let fourNav = AppNavigationController(rootViewController: myCenter)
        fourNav.tabBarItem.title = "我的"
        fourNav.tabBarItem.badgeValue = "new"
        fourNav.tabBarItem.image = UIImage(named: kTabFourImageN)
        fourNav.tabBarItem.selectedImage = UIImage(named: kTabFourImageP)
        fourNav.setNavigationBarHidden(true, animated: true)
        self.addChildViewController(fourNav)
        
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
