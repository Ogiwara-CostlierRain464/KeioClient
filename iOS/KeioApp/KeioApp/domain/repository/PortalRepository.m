//
//  PortalRepository.m
//  KeioApp
//
//  Created by 荻原湧志 on 2018/05/31.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PortalRepository.h"
#import "Constants.h"
#import "utils.h"
#import "Scraping.h"
#import <Ono/Ono.h>

@implementation PortalRepository
+ (PortalRepository *)shared{
    static PortalRepository *instance;
    if(instance == nil){
        instance = [[self alloc] init];
    }
    return instance;
}

- (void)index:(AccessKey *)accessKey compleion:(void (^)(Portal *))completionHandler{
    
    NSArray *cookies = accessKey.cookies;
    NSURLRequest *req = http_get(PortalURL, accessKey.cookies);
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        ONOXMLDocument *document = [ONOXMLDocument XMLDocumentWithData:data error:nil];
        
        ONOXMLElement *elm = [document firstChildWithCSS:@"title"];
        //My name
        NSArray<ONOXMLElement *> *elements = [[document.rootElement firstChildWithCSS:@".login_info"] children];

        NSString *name = [[[[NSString alloc] initWithFormat:@"%@", elements[0]] stringByReplacingOccurrencesOfString:@"<li>" withString:@""] stringByReplacingOccurrencesOfString:@" 君、keio.jpへようこそ。</li>" withString:@""];
        //Messages
        NSArray<ONOXMLElement *> *messages = [[document.rootElement firstChildWithCSS:@".info-cont"] children];
    
        NSString *title;
        NSString *detail;
        for (ONOXMLElement *element in messages) {
            if([[element description] containsString:@"dialog_disp_1"]){
                title = [element description];
            }
            if([[element description] containsString:@"info-detail"]){
                detail = [element description];
            }
        }
        
        Portal *index = [[Portal alloc] init];
        Me *me = [[Me alloc] init];
        PortalMessage *message = [[PortalMessage alloc] init];
        
        me.name = name;
        
        message.title = title;
        message.detail = detail;
        
        index.me = me;
        index.messages = @[message];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(index);
        });
    }];
    
    [task resume];
}
@end
