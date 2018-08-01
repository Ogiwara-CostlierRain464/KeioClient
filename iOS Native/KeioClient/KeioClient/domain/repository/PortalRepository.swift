//
//  PortalRepository.swift
//  KeioClient
//
//  Created by 荻原湧志 on 2018/05/03.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class PortalRepository {
    
    let cookies: [Cookie]
    
    init(cookies: [Cookie]){
        self.cookies = cookies
    }
    
    var index: Single<Index>{
        get{
            return Single<Index>.create(subscribe: { (observer) -> Disposable in
                let request = Alamofire.request(Url.portal.rawValue,
                                                method: .post ,
                                                parameters: ["cookie": self.cookies.encode()])
                    .responseJSON { res in
                        switch res.result {
                        case .success(_):
                            do{
                                let index = try JSONDecoder().decode(Index.self, from: res.data!)
                                observer(.success(index))
                            } catch let error{
                                observer(.error(error))
                            }
                        case .failure(let error):
                            observer(.error(error))
                        }
                    }
                
                return Disposables.create { request.cancel() }
            })
        }
    }
}
