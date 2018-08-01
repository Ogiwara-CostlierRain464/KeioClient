//
//  RxTest.swift
//  KeioClientTests
//  Created by 荻原湧志 on 2018/05/04.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

import XCTest
import RxSwift
import RxBlocking
@testable import KeioClient

class RxTest : XCTestCase{
    
    func testFirstRx(){
        let observable = Observable.from([1,2,3,4])
            .map({
                $0 * 2
            })
            .filter({
                $0 / 2 != 0
            })
        
        let result = try! observable.toBlocking().toArray()
        assert([2,4,6,8] == result)
    }
    
    func testSubject(){
        let subject = ReplaySubject<Int>.create(bufferSize: 1)
        
       // let scheduler = SerialDispatchQueueScheduler(globalConcurrentQueuePriority: .Default)
        
        subject
            //.observeOn(scheduler)
            .subscribe({
                print($0)
            })
        
        subject.onNext(2)
        
        sleep(1)
        
    }
}
