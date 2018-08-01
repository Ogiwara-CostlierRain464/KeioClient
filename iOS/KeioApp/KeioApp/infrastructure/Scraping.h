//
//  Scraping.h
//  KeioApp
//
//  Created by 荻原湧志 on 2018/06/06.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#ifndef Scraping_h
#define Scraping_h
#import <Foundation/Foundation.h>
#import "Portal.h"
#import "Education.h"
#import "Class.h"

@interface Scraping : NSObject

+(Scraping *) shared;

-(Portal *) portal: (NSString *) html;
-(Education *) education: (NSString *) html;
-(ClassList *) classList: (NSString *) html;

@end

#endif /* Scraping_h */
