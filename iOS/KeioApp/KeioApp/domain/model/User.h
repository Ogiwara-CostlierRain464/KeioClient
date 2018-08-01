//
//  User.h
//  KeioApp
//
//  Created by 荻原湧志 on 2018/05/28.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#ifndef User_h
#define User_h
#import <Foundation/Foundation.h>

__attribute__ ((deprecated))
@interface User : NSObject

@property NSString *email;
@property NSString *password;

-(id)initWithEmailAndPassword: (NSString *)email password: (NSString *)password;

@end

#endif /* User_h */
