//
//  AppDelegate.h
//  KeioApp
//
//  Created by 荻原湧志 on 2018/05/28.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AccessKey.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong) NSPersistentContainer *persistentContainer;

+ (AppDelegate *)shared;
- (void)didLogin: (AccessKey *) accessKey;
- (void)saveContext;

@end

