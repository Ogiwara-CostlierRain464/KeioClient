//
//  TestNavigationViewController.swift
//  KeioClient
//
//  Created by 荻原湧志 on 2018/05/06.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

import UIKit

class TestNavigationViewController: UITableViewController {
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        cell.textLabel!.text = String(indexPath.row)
        return cell
    }
}

