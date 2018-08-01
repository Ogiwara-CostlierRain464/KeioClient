//
//  PortalViewController.m
//  KeioApp
//
//  Created by 荻原湧志 on 2018/05/30.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#import "PortalViewController.h"
#import "Constants.h"
#import "PortalRepository.h"
#import "PortalMessageDetailViewController.h"
#import "PortalMessageTableViewCell.h"
#import "AppDelegate.h"
#import "AccessKey.h"
#import "LoginDataRepository.h"

@interface PortalViewController ()
{
    NSMutableArray<PortalMessage *> *dataSource;
}



@end

@implementation PortalViewController
{
    id disposable;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    dataSource = [[NSMutableArray alloc] init];
    
    [[LoginDataRepository shared] addObserver:self];
}

-(void)didLogin: (AccessKey *)accessKey{
    [[PortalRepository shared] index:accessKey compleion:^(Portal *portal) {
        [self->dataSource addObjectsFromArray: portal.messages];
        [self.tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PortalMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"Cell"];
    
    [cell setData: dataSource[indexPath.row]];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if(![segue.identifier isEqualToString:@"segueShowDetail"]){
        return;
    }
    
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    
    if(path == nil){
        return;
    }
    
    PortalMessageDetailViewController *ctrl = segue.destinationViewController;
    NSInteger index = [path row];
    ctrl.message = [dataSource objectAtIndex:index];
}

- (void)dealloc
{
 //   [disposable dispose];
}

@end
