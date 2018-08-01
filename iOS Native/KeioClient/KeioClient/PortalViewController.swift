//
//  PortalViewController.swift
//  KeioClient
//
//  Created by 荻原湧志 on 2018/05/05.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

import UIKit
import RxSwift

class PortalViewController: UITableViewController {

    var dataSource: [Message] = []
    var disposeable: Disposable? = nil
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Portal VC has appear")
        
        //loadMessages()
    }
    
    /*
    private func loadMessages(){
        //guard let cookies = CookieRepository.shared.cookies else { return }
        
        CookieRepository.shared.subject
            .observeOn(MainScheduler.instance)
            //.timeout(<#T##dueTime: RxTimeInterval##RxTimeInterval#>, scheduler: <#T##SchedulerType#>)
        
        let repo = PortalRepository.init(cookies: cookies)
        repo.index
            .observeOn(MainScheduler.instance)
            .subscribe(
            onSuccess: { e in
                e.messages.forEach {
                    self.dataSource.append($0)
                }
                self.tableView.reloadData()
            },
            onError: { error in
                print(error)
            })
    }*/
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    /*func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! MessageTableViewCell
        cell.detail.text = dataSource[indexPath.row].title
        cell.title.text = dataSource[indexPath.row].detail
        return cell
    }*/
    
    deinit {
        disposeable?.dispose()
    }
}
