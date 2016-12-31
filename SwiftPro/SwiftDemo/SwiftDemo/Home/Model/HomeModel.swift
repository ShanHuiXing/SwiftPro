//
//  HomeModel.swift
//  SwiftDemo
//
//  Created by 陈国辉 on 2016/12/1.
//  Copyright © 2016年 guohui. All rights reserved.
//

import UIKit
import ObjectMapper

class HomeModel: Mappable {
    var  author:String?
    var  createTime:String?
    var  imgUrl:String?
    var  path:String?
    var  title:String?
    var  position:String?
    var  uuid:String?
    
    required init?(map: Map) {
        // 检查 JSON 里是否有一定要有的 "name" 属性
     
    }
    
    // Mappable
    func mapping(map: Map) {
        author       <- map["author"]
        createTime   <- map["createTime"]
        imgUrl       <- map["imgUrl"]
        path         <- map["path"]
        title        <- map["title"]
        position     <- map["position"]
        uuid         <- map["uuid"]
 
    }
 

}



