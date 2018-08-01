//
//  PortalRepository.h
//  KeioApp
//
//  Created by 荻原湧志 on 2018/05/31.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#ifndef PortalRepository_h
#define PortalRepository_h
#import <Foundation/Foundation.h>
#import "Portal.h"
#import "AccessKey.h"

@interface PortalRepository : NSObject

+(PortalRepository *)shared;
-(void)index:(AccessKey *)accessKey compleion: (void(^)(Portal * portal)) completionHandler;
@end
#endif /* PortalRepository_h */
