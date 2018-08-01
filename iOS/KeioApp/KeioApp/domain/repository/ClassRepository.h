//
//  ClassRepository.h
//  KeioApp
//
//  Created by 荻原湧志 on 2018/06/05.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#ifndef ClassRepository_h
#define ClassRepository_h
#import <Foundation/Foundation.h>
#import "Class.h"
#import "AccessKey.h"

@interface ClassRepository : NSObject

+(ClassRepository *)shared;
-(ClassList *)get: (AccessKey *)accessKey;

@end

#endif /* ClassRepository_h */
