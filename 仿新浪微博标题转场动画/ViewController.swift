//
//  ViewController.swift
//  仿新浪微博标题转场动画
//
//  Created by JYD on 16/7/20.
//  Copyright © 2016年 JYD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    private var btn:LLCustomButton?
    /// 是否展现
    var isShow:Bool?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupNav()
        
        let lable = UILabel()
        lable.frame = self.view.bounds
        view.addSubview(lable)
        lable.numberOfLines = 0
        lable.text = "jhrjrrdddddddddddd'ffffffffffffffffffffffffffffffffffffffas''jjjjjjjjjjjdnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn"
        
        
    }
  
    private func setupNav() {
        
        btn = LLCustomButton(type: .Custom)
        
        navigationItem.titleView = btn
        
        btn?.addTarget(self, action: #selector(ViewController.btnClick(_:)), forControlEvents: .TouchUpInside)
        
        
    }
    
    func btnClick(btn:LLCustomButton){
        btn.selected = !btn.selected
        
        
        let memuVC = LLPopController()
        //设置转场代理为父控制器
        memuVC.transitioningDelegate = self
        //设置转场样式为自定义
        memuVC.modalPresentationStyle = .Custom
        
       self.presentViewController(memuVC, animated: true, completion: nil)
        
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UIViewControllerTransitioningDelegate {
    
   
    /**
     负责转场动画的对象
     
     - parameter presented:  当前独享
     - parameter presenting: 转场对象
     - parameter source:     来源
     
     - returns: UIPresentationController 自定义
     */
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        
        
        return LLPresentationController(presentedViewController: presented, presentingViewController: presenting)
    
    }
    /**
     告诉该控制器转产如何出现

     - returns: self
     */
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isShow = true
        
        return self
        
    }
    /**
     告诉该控制器转产如何消失
     - returns: self
     */
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isShow = false
        return self
    }
    
   

}

extension ViewController:UIViewControllerAnimatedTransitioning {
    
    /**
     转场动画出现和消失的时间
     
     - parameter transitionContext: 上下文
     
     - returns: 0.5
     */
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    /**
     专门用于管理 model 如何消失和出现的
     
     - parameter transitionContext: 上下文
     */
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        
        if isShow == true {   //出现

            /// 获取即将展现的 目标View
            guard let showView = transitionContext.viewForKey(UITransitionContextToViewKey) else {
                return
            }
            //将弹出的视图添加到containerView 上
            transitionContext.containerView()?.addSubview(showView)
            
            //执行动画
            showView.transform = CGAffineTransformMakeScale(1.0, 0.0)
            
            //设置锚点
            
            showView.layer.anchorPoint = CGPointMake(0.5, 0.0)
            
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                showView.transform = CGAffineTransformIdentity
                
            }) { (_) in ///动画执行完毕后告诉转场动画的代理完成了
                transitionContext.completeTransition(true)
            }
            
 
        }else { ///消失
            /// 获取即将展现的 目标View
            guard let dismissView = transitionContext.viewForKey(UITransitionContextFromViewKey) else {
                return
            }
            
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                dismissView.transform = CGAffineTransformMakeScale(1.0, 0.000001)
                
                }, completion: { (_) in
                     transitionContext.completeTransition(true)
            })

        
        }
        
        
        
        
    }

}
