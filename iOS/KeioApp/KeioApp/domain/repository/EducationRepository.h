//
//  EducationRepository.h
//  KeioApp
//
//  Created by 荻原湧志 on 2018/06/02.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#ifndef EducationRepository_h
#define EducationRepository_h
#import <Foundation/Foundation.h>
#import "Education.h"
#import "AccessKey.h"
#import <WebKit/WebKit.h>

@interface EducationRepository : NSObject <WKNavigationDelegate>

+(EducationRepository *)shared;
-(void)get: (AccessKey *)accessKey completion: (void(^)(Education *education)) completionHandler;

@end

#endif /* EducationRepository_h */
