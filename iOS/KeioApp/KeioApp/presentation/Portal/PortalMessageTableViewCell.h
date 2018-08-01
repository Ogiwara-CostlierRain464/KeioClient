//
//  MessageTableViewCell.h
//  KeioApp
//
//  Created by 荻原湧志 on 2018/06/01.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PortalMessage.h"

@interface PortalMessageTableViewCell : UITableViewCell

-(void)setData: (PortalMessage *)message;

@end
