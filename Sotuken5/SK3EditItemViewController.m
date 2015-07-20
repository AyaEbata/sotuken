//
//  SK3EditItemViewController.m
//  Sotuken3.3.1
//
//  Created by えばた あや on 2014/11/19.
//  Copyright (c) 2014年 えばた あや. All rights reserved.
//

#import "SK3EditItemViewController.h"

@interface SK3EditItemViewController ()

@end

@implementation SK3EditItemViewController

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

    NSLog(@"editItem:%@", self.editItem);
    self.editField.text = self.editItem;

    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(insert:)];
    self.navigationItem.rightBarButtonItem = doneButton;
    
    [self.delegate switchColorChanged:_checkSwitch];
    
    self.tableView.allowsSelection = NO;
    self.editField.delegate = self;
}

- (void)insert:(id)sender
{
    [self.delegate editItemViewControllerDone:self item:self.editField.text];

    // 画面を閉じるメソッドを呼ぶ
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)checkSwitchChanged:(UISwitch *)sender {
    if (_checkSwitch.on) {
        NSLog(@"Switch ON!");
        self.fontColor = @"Gray";
    }
    else {
        NSLog(@"Switch OFF!");
        self.fontColor = @"Black";
    }

    [self.delegate checkSwichFontColor:self.fontColor];
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
////    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
////    if (cell == nil) {
////        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
////    }
//    // Configure the cell...
//
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
}
@end
