//
//  HomeTableViewCell.swift
//  SwiftDemo
//
//  Created by 陈国辉 on 2016/12/1.
//  Copyright © 2016年 guohui. All rights reserved.
//
import UIKit
import AlamofireImage


class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageV: UIImageView!
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var contentLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    //跟oc的set写法不一样。
    var model : HomeModel?{
        didSet{
            
           let urlStr:String = (model?.imgUrl)!
           let url = URL(string: urlStr)!
           iconImageV.af_setImage(withURL: url, placeholderImage: nil)
           titleLab.text = model?.title
           contentLab.text = (model?.author)! + (model?.position)!   //字符串拼接
            
        }
    }

   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
