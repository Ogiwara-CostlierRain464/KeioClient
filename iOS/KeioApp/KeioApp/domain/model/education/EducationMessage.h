//
//  EducationMessage.h
//  KeioApp
//
//  Created by 荻原湧志 on 2018/06/02.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#ifndef EducationMessage_h
#define EducationMessage_h
#import <Foundation/Foundation.h>

@interface EducationMessage : NSObject

@property NSString *title;
@property NSString *detail;

+(EducationMessage *)messageWithDetail:(NSString *) title detail: (NSString *) detail;


@end

#endif /* EducationMessage_h */
