//
//  AccessKey.m
//  KeioApp
//
//  Created by 荻原湧志 on 2018/06/09.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AccessKey.h"


@implementation AccessKey

@synthesize cookies;

+ (AccessKey *)keyFromCookies:(NSArray *)cookies{
    AccessKey *key = [[AccessKey alloc] init];
    key.cookies = cookies;
    
    return key;
}

@end
