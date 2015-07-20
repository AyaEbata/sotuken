//
//  SK3MasterViewController.h
//  Sotuken3
//
//  Created by えばた あや on 2014/11/16.
//  Copyright (c) 2014年 えばた あや. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SK3EditItemViewController.h"
#import "SK3AddItemViewController.h"
#import "SK3SaveViewController.h"

@interface SK3MasterViewController : UITableViewController <EditItemViewControllerDelegate, AddItemViewControllerDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) NSArray *array2;
@property (nonatomic, strong) NSMutableArray *fontColorChanged;
@property int value;

@end