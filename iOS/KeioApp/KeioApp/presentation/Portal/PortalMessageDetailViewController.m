//
//  MessageDetailViewController.m
//  KeioApp
//
//  Created by 荻原湧志 on 2018/05/31.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#import "PortalMessageDetailViewController.h"

@interface PortalMessageDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *aTitle;
@property (weak, nonatomic) IBOutlet UILabel *detail;

@end

@implementation PortalMessageDetailViewController

@synthesize aTitle;
@synthesize detail;
@synthesize message;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSAssert(message != nil, @"Message can't be null");
    
    aTitle.text = message.title;
    detail.text = message.detail;
}


@end
