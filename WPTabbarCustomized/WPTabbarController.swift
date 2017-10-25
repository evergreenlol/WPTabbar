//
//  WPTabbarController.swift
//  WPTabbarCustomized
//
//  Created by wp on 2017/10/23.
//  Copyright © 2017年 wp. All rights reserved.
//

import UIKit

class WPTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let oneVC = OneViewController()
        //获得class的方法object_getClass
        addChildController(childController: oneVC, title: "首页", imageName: "tab1-heartshow", selectedImageName: "tab1-heart", navVC:object_getClass(UINavigationController.self)!)
        let twoVC = TwoViewController()
        addChildController(childController: twoVC, title: "活动", imageName: "tab2-doctor", selectedImageName: "tab2-doctorshow", navVC: object_getClass(UINavigationController.self)!)
        let threeVC = ThreeViewController()
        addChildController(childController: threeVC, title: "更多", imageName: "tab4-more", selectedImageName: "tab4-moreshow", navVC: object_getClass(UINavigationController.self)!)
        let fourVC = FourViewController()
        addChildController(childController: fourVC, title: "设置", imageName: "tab5-file", selectedImageName: "tab5-fileshow", navVC: object_getClass(UINavigationController.self)!)
        
        let wpbar = WPTabbar()
        self.setValue(wpbar, forKey: "tabBar")
        wpbar.centerBtn.addTarget(self, action: #selector(centerBtnClick), for: .touchUpInside)
    }
    
    @objc func centerBtnClick(){
        let alert = UIAlertController(title: "提示", message: "点击了中间按钮", preferredStyle: .alert)
        let action1:UIAlertAction = UIAlertAction(title: "是", style: .default) { (action) in
            // 在这个回调里实现点击
        }
        alert.addAction(action1)
        self.present(alert, animated: false, completion: nil)
    }
    
    func addChildController(childController:UIViewController, title:String, imageName:String, selectedImageName:String, navVC:AnyClass) {
        childController.title = title
        childController.tabBarItem.image = UIImage.init(named: imageName)?.withRenderingMode(.alwaysOriginal)
        childController.tabBarItem.selectedImage = UIImage.init(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
        childController.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.darkGray], for: .selected)
        
        let nav = UINavigationController.init(rootViewController: childController)
        self.addChildViewController(nav)
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
