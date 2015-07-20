//
//  SK3AppDelegate.h
//  Sotuken3
//
//  Created by えばた あや on 2014/11/16.
//  Copyright (c) 2014年 えばた あや. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SK3AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSUserDefaults *udList;
@property (strong, nonatomic) NSUserDefaults *udColor;
@property (strong, nonatomic) NSUserDefaults *udTitle;

@property (strong, nonatomic) NSMutableArray *nilItem;

@end
