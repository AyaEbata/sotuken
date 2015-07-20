//
//  SK3SaveListItemsViewController.h
//  Sotuken4.1
//
//  Created by えばた あや on 2014/12/19.
//  Copyright (c) 2014年 えばた あや. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SK3AppDelegate.h"
#import "SK3ChangeColorViewController.h"

@interface SK3SaveListItemsViewController : UITableViewController <ChangeColorViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *listArray;
@property (strong, nonatomic) NSMutableArray *colorArray;
@property (strong, nonatomic) NSString *indexText;

@end
