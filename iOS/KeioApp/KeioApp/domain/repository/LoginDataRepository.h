//
//  LoginDataRepository.h
//  KeioApp
//
//  Created by 荻原湧志 on 2018/06/06.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#ifndef LoginDataRepository_h
#define LoginDataRepository_h
#import <Foundation/Foundation.h>
#import "AccessKey.h"

@interface LoginDataRepository : NSObject

+(LoginDataRepository *)shared;

-(void)addObserver:(id<NSObject>)observer;
-(void)removeObserver:(id<NSObject>)observer;
-(void)setData:(AccessKey *) accessKey;

@end

#endif /* LoginDataRepository_h */
