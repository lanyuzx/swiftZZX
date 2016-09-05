//
//  LLPresentationController.swift
//  仿新浪微博标题转场动画
//
//  Created by JYD on 16/7/20.
//  Copyright © 2016年 JYD. All rights reserved.
//

import UIKit

class LLPresentationController: UIPresentationController {
    
    /// 懒加载一个背景按钮
    private lazy var closeBtn:UIButton = {
        
        let btn = UIButton ()
        
        btn.frame = UIScreen.mainScreen().bounds
        btn.backgroundColor = UIColor.darkGrayColor()
        btn.alpha = 0.3
        
        return btn
    
    }()
    
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
    }
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        presentedView()?.frame = CGRect(x: UIScreen.mainScreen().bounds.size.width / 4, y: 62, width: 150, height: 220)
        
        //添加背景遮罩按钮 关闭弹框
        containerView?.insertSubview(closeBtn, atIndex: 0)
        closeBtn.addTarget(self, action: #selector(LLPresentationController.closeBtnClick), forControlEvents: .TouchUpInside)
  
    }
    /**
     按钮的点击事件
     */
    @objc private func closeBtnClick() {
        
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    
    }

}
