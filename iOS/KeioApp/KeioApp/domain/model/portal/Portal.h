//
//  Portal.h
//  KeioApp
//
//  Created by 荻原湧志 on 2018/05/31.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#ifndef Portal_h
#define Portal_h
#import <Foundation/Foundation.h>
#import "Me.h"
#import "PortalMessage.h"

@interface Portal : NSObject

@property Me *me;
@property NSArray<PortalMessage *> *messages;

@end

#endif /* Portal_h */
