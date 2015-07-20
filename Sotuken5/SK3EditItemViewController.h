//
//  SK3EditItemViewController.h
//  Sotuken3.3.1
//
//  Created by えばた あや on 2014/11/19.
//  Copyright (c) 2014年 えばた あや. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditItemViewControllerDelegate;

@interface SK3EditItemViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *editField;
@property (strong, nonatomic) NSString *editItem;
@property (weak, nonatomic) IBOutlet UISwitch *checkSwitch;
@property (strong,nonatomic) NSString *fontColor;

@property (weak, nonatomic) id<EditItemViewControllerDelegate> delegate;

@end

@protocol EditItemViewControllerDelegate <NSObject>

- (void)editItemViewControllerDone:(SK3EditItemViewController *)controller item:(NSString *)item;
- (void)checkSwichFontColor:(NSString *)fontColor;
- (void)switchColorChanged:(UISwitch *)switchCanged;

@end