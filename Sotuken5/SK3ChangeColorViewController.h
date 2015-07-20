//
//  SK3ChangeColorViewController.h
//  Sotuken4.1
//
//  Created by えばた あや on 2014/12/22.
//  Copyright (c) 2014年 えばた あや. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SK3AppDelegate.h"

@protocol ChangeColorViewControllerDelegate;

@interface SK3ChangeColorViewController : UITableViewController

@property (weak, nonatomic) id<ChangeColorViewControllerDelegate> delegate;

@end

@protocol ChangeColorViewControllerDelegate <NSObject>

- (void)switchColorChanged2:(UISwitch *)switchCanged;
- (void)switchColorChanged3:(UISwitch *)switchCanged;
- (void)doneButtonAction;

@end