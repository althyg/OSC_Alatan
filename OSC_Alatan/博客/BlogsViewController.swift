//
//  BlogsViewController.swift
//  OSC_Alatan
//
//  Created by maiziedu on 11/5/15.
//  Copyright © 2015 Alatan. All rights reserved.
//

import UIKit

enum BlogsType
{
    case BlogTypeLatest
    case BlogTypeRecommended
}

class BlogsViewController: OSCObjsViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView = UITableView()
    }
    
//    override func loadView() {
//        self.view = UIView(frame: CGRectMake(0, 0, CGRectGetWidth(UIScreen.mainScreen().bounds), CGRectGetHeight(UIScreen.mainScreen().bounds)))
//    }
    

    
    // 初始化方法
    func initWithNewsListType(type type: BlogsType) -> AnyObject
    {
        return ""
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
