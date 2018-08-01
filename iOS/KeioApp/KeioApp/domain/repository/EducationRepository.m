//
//  EducationRepository.m
//  KeioApp
//
//  Created by 荻原湧志 on 2018/06/02.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EducationMessage.h"
#import "EducationRepository.h"
#import "utils.h"
#import "Constants.h"
#import <Ono/Ono.h>
#import <WebKit/WebKit.h>

@implementation EducationRepository

+ (EducationRepository *)shared{
    static EducationRepository *instance;
    if(instance == nil){
        instance = [[EducationRepository alloc] init];
    }
    return instance;
}

static void aha(AccessKey *accessKey, void (^completionHandler)(Education *)) {
    NSURLRequest *req = http_get(EducationURL, accessKey.cookies);
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *err;
        ONOXMLDocument *document = [ONOXMLDocument XMLDocumentWithData:data error:&err];
        
        //Messages
        NSMutableArray<EducationMessage *> __block *news = [[NSMutableArray alloc] init];
        NSMutableArray<EducationMessage *> __block *unread = [[NSMutableArray alloc] init];
        NSMutableArray<EducationMessage *> __block *submitRequire = [[NSMutableArray alloc] init];
        NSMutableArray<EducationMessage *> __block *submitted = [[NSMutableArray alloc] init];
        
        
        ONOXMLElement *elm = [document firstChildWithCSS:@"title"];
        
        /*
         [document.rootElement enumerateElementsWithCSS:@".stdnews" usingBlock:^(ONOXMLElement * _Nonnull element_1, NSUInteger idx, BOOL * _Nonnull stop) {
         
         if([[[element_1 firstChildWithCSS:@"h4"] description] containsString:@"未読教材"]){
         for(ONOXMLElement *tr in [[element_1 firstChildWithCSS:@"tbody"] children]){
         NSString *title = [[tr firstChildWithCSS:@"form button div"] description];
         NSString *detail = @"ww";
         
         [unread addObject: [EducationMessage messageWithDetail:title detail:detail]];
         }
         }
         
         if([[[element_1 firstChildWithCSS:@"h4"] description] containsString:@"提出要レポート"]){
         for(ONOXMLElement *tr in [[element_1 firstChildWithCSS:@"tbody"] children]){
         NSString *title = [[tr firstChildWithCSS:@"form button div"] description];
         NSString *detail = @"ww";
         
         [submitRequire addObject: [EducationMessage messageWithDetail:title detail:detail]];
         }
         }
         
         if([[[element_1 firstChildWithCSS:@"h4"] description] containsString:@"提出物"]){
         for(ONOXMLElement *tr in [[element_1 firstChildWithCSS:@"tbody"] children]){
         NSString *title = [[tr firstChildWithCSS:@"form button div"] description];
         NSString *detail = @"ww";
         
         [submitted addObject: [EducationMessage messageWithDetail:title detail:detail]];
         }
         }
         }];
         */
        NSString *detail = @"ww";
        
        [unread addObject: [EducationMessage messageWithDetail:[elm description] detail:detail]];
        
        Education *education = [[Education alloc] init];
        
        education.news = news;
        education.unreadDocuments = unread;
        education.submitRequiredReports = submitRequire;
        education.submittedReports = submitted;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(education);
        });
    }];
    
    [task resume];
}

- (void)get:(AccessKey *)accessKey completion:(void (^)(Education *))completionHandler{
    
    WKWebView *web = [[WKWebView alloc] init];
    NSURLRequest *req = http_get(EducationURL, accessKey.cookies);
    [web loadRequest: req];
    [web setNavigationDelegate:self];
    
    
    //aha(accessKey, completionHandler);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    if(webView.URL.absoluteString == EducationURL){
        NSLog(@"");
    }else{
        NSLog(@"");
    }
}
@end
