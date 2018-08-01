//
//  utils.m
//  KeioApp
//
//  Created by 荻原湧志 on 2018/06/06.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "utils.h"

NSURLRequest* http_get(NSString *url, NSArray<NSHTTPCookie *> * _Nonnull cookies){
    
    NSURL *uri = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:uri];
    NSDictionary *dic = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
    [request setAllHTTPHeaderFields: dic];
    
    return request;
}
