//
//  NewsViewController.swift
//  OSC_Alatan
//
//  Created by maiziedu on 11/5/15.
//  Copyright © 2015 Alatan. All rights reserved.
//

import UIKit

enum NewsListType {
    
    case NewsListTypeAllType
    case NewsListTypeNews
    case NewsListTypeSynthesis
    case NewsListTypeSoftwareRenew
    case NewsListTypeAllTypeWeekHottest
    case NewsListTypeAllTypeMonthHottest
}

class NewsViewController: OSCObjsViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView = UITableView()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func loadView() {
//        self.view = UIView(frame: CGRectMake(0, 0, CGRectGetWidth(UIScreen.mainScreen().bounds), CGRectGetHeight(UIScreen.mainScreen().bounds)))
//    }
    
    // 初始化方法
    func initWithNewsListType(type type: NewsListType) -> AnyObject
    {
        return ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
