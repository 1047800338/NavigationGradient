//
//  AppDelegate.h
//  ImitateQQTopStretching
//
//  Created by 众力金融 on 2017/9/12.
//  Copyright © 2017年 众力金融. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

