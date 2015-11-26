//
//  OSCTabBarController.swift
//  OSC_Alatan
//
//  Created by maiziedu on 11/3/15.
//  Copyright © 2015 Alatan. All rights reserved.
//

import UIKit

class OSCTabBarController: UITabBarController {

    var newsViweCtl: NewsViewController?
    var hotNewsViewCtl: NewsViewController?
    var blogViewCtl: BlogsViewController?
    var hotBlogViewCtl: BlogsViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*暂时简单初始化综合模块里几个子控制器*/
        // 资讯
        newsViweCtl = NewsViewController()
        newsViweCtl!.view.backgroundColor = UIColor.orangeColor()
        // 热门
        hotNewsViewCtl = NewsViewController()
        hotNewsViewCtl?.view.backgroundColor = UIColor.grayColor()
        // 博客
        blogViewCtl = BlogsViewController()
        blogViewCtl?.view.backgroundColor = UIColor.redColor()
        // 推荐
        hotBlogViewCtl = BlogsViewController()
        hotBlogViewCtl?.view.backgroundColor = UIColor.blueColor()
        
        // 综合
        let newsSVC: SwipableViewController = SwipableViewController().initWithTitle("综合", subTitles: ["资讯", "热点", "博客", "推荐"], controllers:  [newsViweCtl!, hotNewsViewCtl!, blogViewCtl!, hotBlogViewCtl!]) as! SwipableViewController
        
        // 动弹
        let tweetsSVC: SwipableViewController = SwipableViewController()
        
        
        // 发现
        let discoverSB = UIStoryboard.init(name: "Discover", bundle: NSBundle.mainBundle())
        let discoverNav = discoverSB.instantiateViewControllerWithIdentifier("Nav")
        
        // 我
        let homePageSB = UIStoryboard.init(name: "Homepage", bundle: NSBundle.mainBundle())
        let homePageNav = homePageSB.instantiateViewControllerWithIdentifier("Nav")
        
        
        // 构建 TabBar 控制器
        self.viewControllers = [self.addNavigationItemForViewController(newsSVC),
            self.addNavigationItemForViewController(tweetsSVC),
            UIViewController(),
            discoverNav,
            homePageNav]
        
        let titles = ["综合", "动弹", "", "发现", "我"]
        let images = ["tabbar-news", "tabbar-tweet", "", "tabbar-discover", "tabbar-me"]
        for (index, obj) in (self.tabBar.items?.enumerate())! {
            let item: UITabBarItem = obj
            item.title = titles[index]
            item.image = UIImage(named: images[index])?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            
//            item.image? = 
            item.selectedImage = UIImage(named: "\(images[index])-selected")
        }
        
        self.tabBar.items![2].enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func addNavigationItemForViewController(vController: UIViewController) -> UINavigationController {
        let navCtrl = UINavigationController.init(rootViewController: vController)
        
        vController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "navigationbar-sidebar"), style: UIBarButtonItemStyle.Plain, target: self, action: "onClickMenuButton")
        
        return navCtrl
    }
    
    func onClickMenuButton() {
        self.sideMenuViewController.presentLeftMenuViewController()
    }
}
