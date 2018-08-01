//
//  Message.h
//  KeioApp
//
//  Created by 荻原湧志 on 2018/05/31.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#ifndef Message_h
#define Message_h
#import <Foundation/Foundation.h>

@interface PortalMessage : NSObject

@property NSString *title;
@property NSString *detail;

+(PortalMessage *)messageWithDetail:(NSString *) title detail: (NSString *) detail;

@end

#endif /* Message_h */
