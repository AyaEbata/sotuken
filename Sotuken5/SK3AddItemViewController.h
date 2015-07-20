//
//  SK3AddItemViewController.h
//  Sotuken3
//
//  Created by えばた あや on 2014/11/16.
//  Copyright (c) 2014年 えばた あや. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddItemViewControllerDelegate;

@interface SK3AddItemViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) id<AddItemViewControllerDelegate> delegate;

@end

@protocol AddItemViewControllerDelegate <NSObject>

- (void)addItemViewControllerDidCancel:(SK3AddItemViewController *)controller;
- (void)addItemViewControllerDidFinish:(SK3AddItemViewController *)controller item:(NSString *)item;

@end