//
//  SwipableViewController.swift
//  OSC_Alatan
//
//  Created by maiziedu on 11/5/15.
//  Copyright © 2015 Alatan. All rights reserved.
//

import UIKit

class SwipableViewController: UIViewController {

    // 两个属性变量
    var viewPaper: HorizonalTableViewController?
    var titleBar: TitleBarView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 两个初始化方法
    func initWithTitle(title: String, subTitles: [String], controllers: [AnyObject]) -> AnyObject {
        
        return self.initWithTitle(title, subTitles: subTitles, controllers: controllers, underTabbar: false)
    }
    
    
    func initWithTitle(title: String, subTitles: [String], controllers: [AnyObject], underTabbar: Bool) -> AnyObject {
        
        // http://stackoverflow.com/questions/18798792/explaining-difference-between-automaticallyadjustsscrollviewinsets-extendedlayo
        self.edgesForExtendedLayout = UIRectEdge.None
        
        // 给自身(控制器) 设置 标题
        if !title.isEmpty {self.title = title}
        
        // 初始化顶部菜单栏视图
        let titleBarHeight: CGFloat = 36
        titleBar = TitleBarView().initWithFrame(CGRectMake(0, 0, CGRectGetWidth(self.view.frame), titleBarHeight), titles: subTitles)
        self.view.addSubview(titleBar!)
        
        // 初始化 HorizonalTableViewController 控制器 对象
        viewPaper = HorizonalTableViewController().initWithViewControllers(controllers)
        let height = CGRectGetHeight(UIScreen.mainScreen().bounds) - titleBarHeight
        viewPaper?.view.frame = CGRectMake(0, titleBarHeight, CGRectGetWidth(UIScreen.mainScreen().bounds), height)
        self.view.addSubview((viewPaper?.view)!)
        
        
        titleBar?.titleButtonClicked = { (index: Int) in
            print("\(index)")
            self.viewPaper?.scrollToViewAtIndex(index)
        }
        
        return self
    }
    
    
}


