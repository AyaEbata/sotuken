//
//  SK3SaveListViewController.m
//  Sotuken4.1
//
//  Created by えばた あや on 2014/12/12.
//  Copyright (c) 2014年 えばた あや. All rights reserved.
//

#import "SK3SaveListViewController.h"

@interface SK3SaveListViewController () {
    NSMutableArray *_titleList;
    NSArray *_titleArray;
    NSString *_indexText;
    SK3AppDelegate *_appDelegate;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *returnButton;

@end

@implementation SK3SaveListViewController

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
    
    self.navigationItem.title = @"Save List";
    
    UIColor *pinkbar = [UIColor colorWithRed:254/255.0 green:166/255.0 blue:242/255.0 alpha:1.0];
    self.navigationController.navigationBar.tintColor = pinkbar;
    self.navigationController.toolbar.tintColor = pinkbar;

    _appDelegate = (SK3AppDelegate *)[[UIApplication sharedApplication] delegate];
    _appDelegate.udTitle = [NSUserDefaults standardUserDefaults];

    _titleArray = [_appDelegate.udTitle objectForKey:@"title"];
    _titleList = [_titleArray mutableCopy];
    
    NSLog(@"titleList2 %@", _titleList);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)returnButtonClicked:(id)sender {
    [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"top");
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	switch(indexPath.row) {
		default:
			return 35;
	}
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _titleList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        // 再利用できない場合は新規で作成
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"Cell"];
    }

    // Configure the cell...
    cell.textLabel.text = _titleList[indexPath.row];
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_titleList removeObjectAtIndex:indexPath.row];
        [_appDelegate.udTitle setObject:_titleList forKey:@"title"];
        [_appDelegate.udTitle synchronize];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

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

    _indexText = _titleList[indexPath.row];
    NSLog(@"index %@", _indexText);
    [self performSegueWithIdentifier:@"itemList" sender:self];
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // セグエのidentifierが"ShowAddItemView"の場合
    if ([[segue identifier] isEqualToString:@"itemList"]) {
        SK3SaveListItemsViewController *saveListItems = [segue destinationViewController];
        saveListItems.indexText = _indexText;
    }
}

@end
