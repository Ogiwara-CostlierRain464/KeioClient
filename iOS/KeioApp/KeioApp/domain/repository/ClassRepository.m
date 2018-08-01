//
//  ClassRepository.m
//  KeioApp
//
//  Created by 荻原湧志 on 2018/06/05.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassRepository.h"

@implementation ClassRepository

+ (ClassRepository *)shared{
    static ClassRepository *instance;
    if(instance == nil){
        instance = [[ClassRepository alloc] init];
    }
    
    return instance;
}

- (ClassList *)get:(AccessKey *)accessKey{
    //TODO Scraping.
    
    ClassList *list = [[ClassList alloc] init];
    NSDate *date = [NSDate date];
    NSArray<ClassColumn *> *cancelled = @[[ClassColumn classColumnWithDate:date subject:@"Math I"],
                                          [ClassColumn classColumnWithDate:date subject:@"English"]];
    
    
    NSArray<ClassColumn *> *makeUp = @[[ClassColumn classColumnWithDate:date subject:@"Biology"]];
    
    list.cancelled = cancelled;
    list.makeUp = makeUp;
    
    return list;
}

@end
