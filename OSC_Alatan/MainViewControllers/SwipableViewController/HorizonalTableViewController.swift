//
//  HorizonalTableViewController.swift
//  OSC_Alatan
//
//  Created by maiziedu on 11/5/15.
//  Copyright © 2015 Alatan. All rights reserved.
//

import UIKit

class HorizonalTableViewController: UITableViewController {

    // 数组存储 要显示的多个 控制器的视图
    var _controllers: Array<AnyObject>?
    
    
    // MARK: - 自定义构造方法初始化 水平 控制器
    func initWithViewControllers(controllers: [AnyObject]) -> HorizonalTableViewController {
        _controllers = controllers
        for vc: AnyObject in controllers {
            let controller = vc as! UIViewController
            self.addChildViewController(controller)
        }
        return self
    }
    
    
     // MARK: - Controller 指定构造器
    init() {
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* 初始化 水平管理控制器里面的 tableView 并设置相应属性 */
        self.tableView = UITableView()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.pagingEnabled = true
        // 旋转 tableView －180 度
        self.tableView.transform = CGAffineTransformMakeRotation(-CGFloat(M_PI_2))
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (_controllers == nil) {
            return 0
        }
        return (_controllers?.count)!
    }

    /*这里主要是把各个控制器的 视图 以 子视图的形式 add 到 cell*/
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) 

        cell.contentView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
        cell.contentView.backgroundColor = UIColor(colorLiteralRed: 235.0/255, green: 235.0/255, blue: 243.0/255, alpha: 1)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        // 这是 add 方式
        let controller = _controllers![indexPath.row]
        controller.view!!.frame = cell.contentView.bounds
        cell.contentView.addSubview(controller.view!!)
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGRectGetWidth(self.tableView.frame)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - 滚动代理
    override func scrollViewDidScroll(scrollView: UIScrollView) {
      
    }
    
    override func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
    }
    
    // MARK: - 对外接口，滚动到指定位置
    func scrollToViewAtIndex(index: Int) {
        
        let indexPath = NSIndexPath(forRow: index, inSection: 0)
        self.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition:UITableViewScrollPosition.None , animated: false)
    }
}
