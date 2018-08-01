//
//  Class.h
//  KeioApp
//
//  Created by 荻原湧志 on 2018/06/05.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#ifndef Class_h
#define Class_h
#import <Foundation/Foundation.h>

@interface ClassColumn : NSObject

@property NSDate *date;
@property NSString *subject;

+(ClassColumn *)classColumnWithDate:(NSDate *)date subject: (NSString *)aSubject;

@end

@interface ClassList : NSObject

@property NSArray<ClassColumn *> *cancelled;
@property NSArray<ClassColumn *> *makeUp;

@end

#endif /* Class_h */
