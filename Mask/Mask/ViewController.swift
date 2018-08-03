//
//  ViewController.swift
//  Mask
//
//  Created by EU_ShenJie on 2018/8/2.
//  Copyright © 2018年 EU_ShenJie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        topView.layer.contents = UIImage(named: "layer")?.cgImage
        topView.layer.contentsGravity = kCAGravityResizeAspect
        topView.layer.contentsScale = 1.0
        
        middleView.layer.contents = UIImage(named: "mask")?.cgImage
        middleView.layer.contentsGravity = kCAGravityResizeAspect
        middleView.layer.contentsScale = 1.0
        
        let maskLayer = CALayer()
        //这句不能少，少了没图
        maskLayer.frame = bottomView.bounds
        
        maskLayer.contents = UIImage(named: "mask")?.cgImage
        maskLayer.contentsGravity = kCAGravityResizeAspect
        maskLayer.contentsScale = 1.0
        
        bottomView.layer.contents = UIImage(named: "layer")?.cgImage
        bottomView.layer.contentsGravity = kCAGravityResizeAspect
        bottomView.layer.contentsScale = 1.0
        bottomView.layer.mask = maskLayer
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!.location(in: self.view!)
        let point = bottomView.layer.convert(touch, from: self.view.layer)
        
        if (bottomView.layer.contains(point)) {
            print("bottom")
        }else  {
            print("no bottom")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

