//
//  EducationMessage.m
//  KeioApp
//
//  Created by 荻原湧志 on 2018/06/02.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EducationMessage.h"

@implementation EducationMessage

@synthesize title;
@synthesize detail;

+ (EducationMessage *)messageWithDetail:(NSString *)title detail:(NSString *)detail{
    EducationMessage *message = [[EducationMessage alloc] init];
    message.title = title;
    message.detail = detail;
    
    return message;
}

@end
