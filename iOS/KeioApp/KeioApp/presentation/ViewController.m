//
//  ViewController.m
//  KeioApp
//
//  ホーム画面の基底ViewController。
//  Created by 荻原湧志 on 2018/05/28.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#import "ViewController.h"
#import "Constants.h"
#import "AppDelegate.h"
#import "AccessKey.h"

@interface ViewController ()
{
    WKWebView *webView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self tryLogin];
    //各View生成後にNotificationにpush
    //[self fakeLogin];
}

-(void)fakeLogin{
//    [[AppDelegate shared] completeLogin: @[@"FAKE_COOKIES"]];
    [[AppDelegate shared] didLogin: [[AccessKey alloc] init] ];
}

-(void)tryLogin{
    [self setUpWebView];
}
-(void)didLogin{
    [WKWebsiteDataStore.defaultDataStore.httpCookieStore getAllCookies:^(NSArray* cookies){
        [[AppDelegate shared] didLogin: [AccessKey keyFromCookies:cookies] ];
    }];
}

-(void)setUpWebView{
    webView = [WKWebView new];
    NSString *url = PortalURL;
    NSURL *nsurl = [[NSURL alloc] initWithString: url];
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL: nsurl];
    
    [webView loadRequest: req];
    [webView setNavigationDelegate:self];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    
    if([webView.URL.absoluteString containsString: OAuthURL]){
        
         NSString *js =[NSString stringWithFormat: @""
                        "form = document.forms.login;"
                        "form.j_username.value = 'MAIL ADDRESS';"
                        "form.j_password.value = 'PASSWORD'; "
                        "login = document.getElementsByName('_eventId_proceed')[0]; "
                        "login.click();"];
        
        [webView evaluateJavaScript: js completionHandler: ^(id obj, NSError *error){
            //Do nothing, just for debug.
        }];
    }
    
    if([webView.URL.absoluteString containsString: PortalURL]){
        
        [self didLogin];
    }
}

@end
