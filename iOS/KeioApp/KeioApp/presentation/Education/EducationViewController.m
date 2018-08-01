//
//  EducationViewController.m
//  KeioApp
//
//  Created by 荻原湧志 on 2018/06/02.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#import "EducationViewController.h"
#import "EducationMessage.h"
#import "Constants.h"
#import "EducationRepository.h"
#import "EducationMessageTableViewCell.h"
#import "AppDelegate.h"
#import "LoginDataRepository.h"
#import "AccessKey.h"
#import <WebKit/WebKit.h>
#import "utils.h"

@interface EducationViewController ()

@end

// セクションについて
// New, Unread document, Submit Required Report, Submitted Report
//
@implementation EducationViewController
{
    NSArray<NSString *> *sections;
    
    NSArray<EducationMessage *> *news;
    NSArray<EducationMessage *> *unreadDocuments;
    NSArray<EducationMessage *> *submitRequiredReport;
    NSArray<EducationMessage *> *submittedReport;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    sections = @[@"New", @"Unread document", @"Submit required report", @"Submitted report"];
    
    news = @[];
    unreadDocuments = @[];
    submitRequiredReport = @[];
    submittedReport = @[];
    
    [[LoginDataRepository shared] addObserver:self];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    if([webView.URL.absoluteString containsString:EducationURL]){
        [webView evaluateJavaScript:@"document.body.innerHTML" completionHandler:^(id _Nullable data, NSError * _Nullable error) {
            NSLog(@"%@", data);
        }];
    }
}

-(void)didLogin:(AccessKey *)accessKey{
    WKWebView *web = [[WKWebView alloc] init];
    
    [self.view addSubview:web];
    
    [web setNavigationDelegate:self];
    [web loadRequest: http_get(EducationURL, accessKey.cookies)];
    /*
    [[EducationRepository shared] get:accessKey completion:^(Education *education) {
        self->news = education.news;
        self->unreadDocuments = education.unreadDocuments;
        self->submitRequiredReport = education.submitRequiredReports;
        self->submittedReport = education.submittedReports;
        
        [self.tableView reloadData];
    }];*/
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return sections.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [sections objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0: //News
            return news.count;
            
        case 1: //Unread document
            return unreadDocuments.count;
            
        case 2: //Submit required report
            return submitRequiredReport.count;
            
        case 3: //Submitted report
            return submittedReport.count;
        default:
            return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EducationMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    switch (indexPath.section) {
        case 0:
            [cell setData: [news objectAtIndex:[indexPath row]]];
            break;
        case 1:
            [cell setData: [unreadDocuments objectAtIndex:[indexPath row]]];
            break;
        case 2:
            [cell setData: [submitRequiredReport objectAtIndex:[indexPath row]]];
            break;
        case 3:
            [cell setData: [submittedReport objectAtIndex:[indexPath row]]];
            break;
        default:
            NSAssert(NO, @"Index path failure.");
            break;
    }
    
    return cell;
}

- (void)dealloc
{
    //[disposable dispose];
}


@end
