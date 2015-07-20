//
//  SK3SaveViewController.m
//  Sotuken4.1
//
//  Created by えばた あや on 2014/12/12.
//  Copyright (c) 2014年 えばた あや. All rights reserved.
//

#import "SK3SaveViewController.h"

@interface SK3SaveViewController () {
    NSMutableArray *_titleList;
    SK3AppDelegate *_appDelegate;
}

@end

@implementation SK3SaveViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UIColor *pinkbar = [UIColor colorWithRed:254/255.0 green:166/255.0 blue:242/255.0 alpha:1.0];
    self.navigationController.navigationBar.tintColor = pinkbar;
    self.navigationController.toolbar.tintColor = pinkbar;

    _appDelegate = (SK3AppDelegate *)[[UIApplication sharedApplication] delegate];
    _appDelegate.udTitle = [NSUserDefaults standardUserDefaults];
    _appDelegate.udList = [NSUserDefaults standardUserDefaults];
    _appDelegate.udColor = [NSUserDefaults standardUserDefaults];

    self.titleField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButton:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (BOOL)textFieldShouldReturn:(UITextField *)sender {
    
    // キーボードを閉じる
    [sender resignFirstResponder];
    
    return TRUE;
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    return cell;
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */

    if (indexPath.section == 0 && indexPath.row == 1) {
        if ([self.titleField.text length] == 0) {
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"タイトルを入力してください！"
                                  message:nil
                                  delegate:nil
                                  cancelButtonTitle:nil otherButtonTitles:@"OK！",nil];
            [alert show];
        }
        
        else {            
            NSArray *_checkItems = [_appDelegate.udTitle objectForKey:@"title"];
            NSLog(@"checkList %@", _checkItems);

            if ([_checkItems containsObject:self.titleField.text]) {
                NSLog(@"ju-huku!");
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:@"タイトルが重複してます！"
                                      message:nil
                                      delegate:nil
                                      cancelButtonTitle:nil otherButtonTitles:@"OK！",nil];
                [alert show];
            }
            
            else {
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:@"保存完了！"
                                      message:nil
                                      delegate:self
                                      cancelButtonTitle:nil otherButtonTitles:@"OK！",nil];
                [alert show];
            }
        }
    }
}

- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            NSLog(@"OK!");
            NSString *str1 = [NSString stringWithFormat:@"%@1", self.titleField.text];
            NSString *str2 = [NSString stringWithFormat:@"%@2", self.titleField.text];
            [_appDelegate.udList setObject:self.saveListArray forKey:str1];
            [_appDelegate.udColor setObject:self.saveColorArray forKey:str2];
            [_appDelegate.udList synchronize];
            [_appDelegate.udColor synchronize];

            NSLog(@"saveList %@", self.saveListArray);
            NSLog(@"saveColor %@", self.saveColorArray);
            
            [self titleListCreate];
            
            [[UIApplication sharedApplication].delegate.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
            break;
    }
}

- (void)titleListCreate {
    if (!_titleList) {
        _titleList = [[NSMutableArray alloc] init];
    }
    
    int i = 0;
    i = [_appDelegate.udTitle integerForKey:@"count"];
    NSLog(@"value %d", i);
    
    if (i == 1) {
        NSArray *titleArray = [_appDelegate.udTitle objectForKey:@"title"];
        _titleList = [titleArray mutableCopy];
    }
    
    [_titleList insertObject:self.titleField.text atIndex:0];    
    [_appDelegate.udTitle setObject:_titleList forKey:@"title"];
    [_appDelegate.udTitle synchronize];
    
    i = 1;
    [_appDelegate.udTitle setInteger:i forKey:@"count"];
    
    NSLog(@"titleList1 %@", _titleList);
}

@end
