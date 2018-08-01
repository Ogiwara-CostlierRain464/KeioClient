//
//  Scraping.m
//  KeioApp
//
//  Created by 荻原湧志 on 2018/06/06.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Scraping.h"

@implementation Scraping

+ (Scraping *)shared{
    static Scraping *instance;
    if(instance == nil){
        instance = [[Scraping alloc] init];
    }
    
    return instance;
}

- (Portal *)portal:(NSString *)html{
    return nil;
}

- (Education *)education:(NSString *)html{
    return nil;
}

- (ClassList *)classList:(NSString *)html{
    return nil;
}

@end
