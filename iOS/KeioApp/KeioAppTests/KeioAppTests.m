//
//  KeioAppTests.m
//  KeioAppTests
//
//  Created by 荻原湧志 on 2018/05/28.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface KeioAppTests : XCTestCase

@end

@implementation KeioAppTests

-(void)testNetwork{
    NSURL *url = [NSURL URLWithString: @"https://www.google.com"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    NSError *error;
    NSURLResponse *rep;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse: &rep error: &error];
 
    NSLog(@"responce = %@", [[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding]);
}


@end
