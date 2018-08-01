//
//  Education.h
//  KeioApp
//
//  Created by 荻原湧志 on 2018/06/02.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#ifndef Education_h
#define Education_h
#import <Foundation/Foundation.h>
#import "EducationMessage.h"

@interface Education : NSObject

@property NSArray<EducationMessage *> *news;
@property NSArray<EducationMessage *> *unreadDocuments;
@property NSArray<EducationMessage *> *submitRequiredReports;
@property NSArray<EducationMessage *> *submittedReports;

@end

#endif /* Education_h */
