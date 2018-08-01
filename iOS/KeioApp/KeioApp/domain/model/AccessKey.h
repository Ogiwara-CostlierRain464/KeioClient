//
//  AccessKey.h
//  KeioApp
//
//  Created by 荻原湧志 on 2018/06/09.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#ifndef AccessKey_h
#define AccessKey_h
#import <Foundation/Foundation.h>

@interface AccessKey : NSObject

@property NSArray *cookies;

+(AccessKey *)keyFromCookies:(NSArray *)cookies;

@end

#endif /* AccessKey_h */
