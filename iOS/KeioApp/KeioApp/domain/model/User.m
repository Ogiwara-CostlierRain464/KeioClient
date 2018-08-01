//
//  User.m
//  KeioApp
//
//  Created by 荻原湧志 on 2018/05/28.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@implementation User

@synthesize email;
@synthesize password;

- (id)initWithEmailAndPassword:(NSString *)email password:(NSString *)password
{
    if((self = [super init]) != nil){
        self.email = email;
        self.password = password;
    }
    return self;
}

@end
