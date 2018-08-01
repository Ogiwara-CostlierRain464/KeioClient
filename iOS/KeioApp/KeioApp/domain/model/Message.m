//
//  Message.m
//  KeioApp
//
//  Created by 荻原湧志 on 2018/05/31.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PortalMessage.h"

@implementation PortalMessage

@synthesize title;
@synthesize detail;

+ (PortalMessage *)messageWithDetail:(NSString *)title detail:(NSString *)detail{
    PortalMessage *message = [[PortalMessage alloc] init];
    message.title = title;
    message.detail = detail;
    
    return message;
}

@end
