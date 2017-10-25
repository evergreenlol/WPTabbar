//
//  WPTabbar.swift
//  WPTabbarCustomized
//
//  Created by wp on 2017/10/23.
//  Copyright © 2017年 wp. All rights reserved.
//

import UIKit

class WPTabbar: UITabBar {

    var centerBtn = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        let btn = UIButton()
        btn.bounds = CGRect(x: 0, y: 0, width: 64, height: 64)
        btn.setImage(UIImage.init(named:"plus_Last"), for: .normal)
        self.centerBtn = btn
        self.addSubview(btn)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.centerBtn.center = CGPoint(x: self.bounds.size.width * 0.5, y: self.bounds.size.height * 0.3)
        let width : CGFloat = self.bounds.size.width / 5
        var y = 0
        for subview : UIView in self.subviews  {
            if subview.isKind(of: NSClassFromString("UITabBarButton")!){
                subview.frame = CGRect(x: CGFloat(y) * width, y: self.bounds.origin.y, width: width, height: self.bounds.height - 2)
                y += 1
                if y == 2{
                    y += 1
                }
            }
        }
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.isHidden == false {
            let newPoint : CGPoint = self.convert(point, to: self.centerBtn)
            
            if self.centerBtn.point(inside: newPoint, with: event) {
                return self.centerBtn
            }else{
                return super.hitTest(point, with: event)
            }
        }
        else{
            return super.hitTest(point, with: event)
        }
    }

}
