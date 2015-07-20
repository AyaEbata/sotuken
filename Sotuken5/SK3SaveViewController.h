//
//  SK3SaveViewController.h
//  Sotuken4.1
//
//  Created by えばた あや on 2014/12/12.
//  Copyright (c) 2014年 えばた あや. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SK3SaveListViewController.h"
#import "SK3AppDelegate.h"

@interface SK3SaveViewController : UITableViewController <UITextFieldDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) NSArray *saveListArray;
@property (strong, nonatomic) NSArray *saveColorArray;

@property (weak, nonatomic) IBOutlet UITextField *titleField;

@end
