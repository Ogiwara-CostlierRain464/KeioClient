//
//  MessageTableViewCell.m
//  KeioApp
//
//  Created by 荻原湧志 on 2018/06/01.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#import "PortalMessageTableViewCell.h"
#import "PortalMessage.h"

@interface PortalMessageTableViewCell  ()

@property PortalMessage *message;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *introduction;

@end

@implementation PortalMessageTableViewCell

@synthesize message;
@synthesize title;
@synthesize introduction;

- (void)setData:(PortalMessage *)message{
    self.message = message;
    
    title.text = message.title;
    introduction.text = message.detail;
}


@end
