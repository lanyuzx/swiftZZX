//
//  LLCustomButton.swift
//  自定义转场动画
//
//  Created by JYD on 16/7/20.
//  Copyright © 2016年 JYD. All rights reserved.
//

import UIKit

class LLCustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        setImage(UIImage(named:"navigationbar_arrow_down"), forState: .Normal)
        setImage(UIImage(named:"navigationbar_arrow_up"), forState: .Selected)
        setTitle("新浪微博  ", forState: .Normal)
        sizeToFit()
        setTitleColor(UIColor.orangeColor(), forState: .Normal)
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel?.frame.origin.x = 0
        
        imageView?.frame.origin.x = (titleLabel?.frame.width)!
    }
}
