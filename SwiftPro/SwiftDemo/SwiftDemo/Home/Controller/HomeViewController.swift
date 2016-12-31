
//  HomeViewController.swift
//  SwiftDemo
//
//  Created by 陈国辉 on 2016/12/1.
//  Copyright © 2016年 guohui. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import ObjectMapper

class HomeViewController: AppBaseViewController,UITableViewDelegate,UITableViewDataSource,MyDelegate
{
    var dataArray:NSMutableArray = []   // 定义全局数组
    @IBOutlet weak var mTableView: UITableView!

    var refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "首页"
        // Do any additional setup after loading the view.
        mTableView.register(UINib(nibName:"HomeTableViewCell", bundle:nil), forCellReuseIdentifier:"HomeCell")
        mTableView.delegate = self
        mTableView.dataSource = self
        self.dataArray = NSMutableArray()
        
        
        //添加刷新
        refreshControl.addTarget(self, action: #selector(HomeViewController.refreshData), for: UIControlEvents.valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "松手刷新新闻")
        mTableView.refreshControl = refreshControl
        refreshData()
//        mTableView.refreshControl?.beginRefreshing()
        
        
        for i in 1...5 {
            print("------\(i)--")
        }
        
        
        let min = 3
        let max = 10
        let time = String.init(format: "%02d:%02d", arguments: [min , max])
        
        print("time:\(time)")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //自定义方法
    func btnClick() {
        print("这是自定义方法")
    }
    func refreshData() {
        
        requestData()
        //下拉刷新延迟2s
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.mTableView.refreshControl?.endRefreshing()
        }
    }
    
    
    //请求数据
    func requestData(){
        
        var headers:Dictionary = [String:String]()
        headers["Content-Type"] = "application/json"
        
        var dic = [String:AnyObject]()
        dic["user"] = "100" as AnyObject?
       
        ////弱引用
        weak var weakSelf = self;
        Alamofire.request("http://118.178.240.74:8080/shf/api/article/list", method:HTTPMethod.get, parameters: dic, encoding: JSONEncoding.default, headers: headers).responseJSON {
            (DataResponse) in
            
            print("dic: ----\(DataResponse.result.value)")
            let jsonDic:NSDictionary = (DataResponse.result.value as AnyObject) as! NSDictionary;
            // 字典转model。用ObjectMapper
            // 判断jsonDic是不是为空，
            if jsonDic.count>0{
                // 用ObjectMapper 来进行转化模型
                let modelArr = Mapper<HomeModel>().mapArray(JSONArray:jsonDic["datasource"] as! Array)!
                print(" ssss  ====\(modelArr)")
                weakSelf?.dataArray.removeAllObjects()
                weakSelf?.dataArray.addObjects(from: modelArr)
                weakSelf?.mTableView.reloadData()
                
            }

        }
        
    }
    
    ///////---- 表格代理
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:HomeTableViewCell! = tableView.dequeueReusableCell(withIdentifier:"HomeCell", for: indexPath) as?HomeTableViewCell
        let model = self.dataArray.object(at: indexPath.row) as! HomeModel
        
        cell.model = model
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = DetailViewController()
        detailVC.mDelegate = self
        detailVC.blockproerty = { (backMsg) in
            print("----\(backMsg)---")
        }
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    ///回调代理
    func didSomething(name:String)
    {
        print("---name:\(name)----")
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
