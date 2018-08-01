//
//  ClassViewController.m
//  KeioApp
//
//  Created by 荻原湧志 on 2018/06/04.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#import "ClassViewController.h"
#import "Class.h"
#import "AppDelegate.h"
#import "Constants.h"
#import "ClassRepository.h"
#import "ClassTableViewCell.h"
#import "LoginDataRepository.h"
#import "AccessKey.h"

@interface ClassViewController ()

@end

@implementation ClassViewController
{
    NSArray<NSString *> *sections;
    
    NSArray<ClassColumn *> *cancelled;
    NSArray<ClassColumn *> *makeUp;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    sections = @[@"Cancelled class", @"Make-up class"];
    
    cancelled = @[];
    makeUp = @[];
    
    /*
    disposable = [[[AppDelegate shared] loginNotification] subscribeNext:^(id obj){
        if(obj == nil){
            return;
        }
        
        ClassList *list = [[ClassRepository shared] get:obj];
        self->cancelled = list.cancelled;
        self->makeUp = list.makeUp;
        
        [self.tableView reloadData];
    }];
     */
    [[LoginDataRepository shared] addObserver:self];
}

-(void)didLogin:(AccessKey *)accessKey{
    ClassList *list = [[ClassRepository shared] get:accessKey];
    cancelled = list.cancelled;
    makeUp = list.makeUp;
    
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return sections.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [sections objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return cancelled.count;
            
        case 1:
            return makeUp.count;
            
        default:
            NSAssert(NO, @"Section count failure.");
            return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ClassTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    switch (indexPath.section) {
        case 0:
            [cell setData: [cancelled objectAtIndex: [indexPath row]]];
            break;
            
        case 1:
            [cell setData: [makeUp objectAtIndex: [indexPath row]]];
            break;
            
        default:
            NSAssert(NO, @"Index path failure.");
            break;
    }
    
    return cell;
}

- (void)dealloc
{
    [[LoginDataRepository shared] removeObserver:self];
}


@end
