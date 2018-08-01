//
//  LoginDataRepository.m
//  KeioApp
//
//  Created by 荻原湧志 on 2018/06/07.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginDataRepository.h"

@interface LoginDataRepository ()
{
    NSMutableArray *observers;
    
    AccessKey *accessKey;
}
@end

@implementation LoginDataRepository

+ (LoginDataRepository *)shared{
    static LoginDataRepository *instance;
    if(instance == nil){
        instance = [[LoginDataRepository alloc] init];
    }
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        observers = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addObserver:(id<NSObject>)observer{
    [observers addObject:observer];
    
    //すでにデータがあるならすぐに送信
    if(accessKey != nil){
        [observer performSelector:@selector(didLogin:) withObject:accessKey];
    }
}

- (void)removeObserver:(id<NSObject>)observer{
    [observers removeObject:observer];
}

- (void)setData:(AccessKey *)accessKey{
    for(id observer in observers){
        [observer performSelector:@selector(didLogin:) withObject:accessKey];
    }
    
    self->accessKey = accessKey;
}

@end
