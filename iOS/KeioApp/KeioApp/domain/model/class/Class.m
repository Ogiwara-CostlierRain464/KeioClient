//
//  Class.m
//  KeioApp
//
//  Created by 荻原湧志 on 2018/06/05.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Class.h"

@implementation ClassColumn

@synthesize date;
@synthesize subject;

+ (ClassColumn *)classColumnWithDate:(NSDate *)date subject:(NSString *)aSubject{
    ClassColumn *class = [[ClassColumn alloc] init];
    
    class.date = date;
    class.subject = aSubject;
    
    return class;
}

@end

@implementation ClassList

@synthesize cancelled;
@synthesize makeUp;

@end
