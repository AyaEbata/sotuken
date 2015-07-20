//
//  SK3SaveListItemsViewController.m
//  Sotuken4.1
//
//  Created by えばた あや on 2014/12/19.
//  Copyright (c) 2014年 えばた あや. All rights reserved.
//

#import "SK3SaveListItemsViewController.h"

@interface SK3SaveListItemsViewController () {
    NSIndexPath *_index;
    SK3AppDelegate *_appDelegate;
    NSString *_str1, *_str2;
}

@end

@implementation SK3SaveListItemsViewController

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
    
    NSLog(@"indexText %@", self.indexText);
    
    if (!self.listArray || !self.colorArray) {
        self.listArray = [[NSMutableArray alloc] init];
        self.colorArray = [[NSMutableArray alloc] init];
    }

    _appDelegate = (SK3AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    _str1 = [NSString stringWithFormat:@"%@1", self.indexText];
    _str2 = [NSString stringWithFormat:@"%@2", self.indexText];
    
    _appDelegate.udList = [NSUserDefaults standardUserDefaults];
    _appDelegate.udColor = [NSUserDefaults standardUserDefaults];
    
    self.listArray = [_appDelegate.udList objectForKey:_str1];
    self.colorArray = [_appDelegate.udColor objectForKey:_str2];
    
    NSLog(@"listArray %@", self.listArray);
    NSLog(@"colorArray %@", self.colorArray);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Check Switch

- (void)switchColorChanged2:(UISwitch *)switchCanged {
    NSLog(@"kakunin!");
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSLog(@"swich!index! %d", indexPath.row);
    
    if ([self.colorArray[indexPath.row] isEqual:@"Gray"]) {
        switchCanged.on = YES;
    }
    else if ([self.colorArray[indexPath.row] isEqual:@"Black"]){
        switchCanged.on = NO;
    }
}

- (void)switchColorChanged3:(UISwitch *)switchCanged {
    NSArray *color2 = [_appDelegate.udColor objectForKey:_str2];
    self.colorArray = [color2 mutableCopy];
    
    if (switchCanged.on) {
        NSLog(@"Switch ON!");
        self.colorArray[_index.row] = @"Gray";
    }
    else {
        NSLog(@"Switch OFF!");
        self.colorArray[_index.row] = @"Black";
    }
    NSLog(@"color %@", self.colorArray);
    
    [_appDelegate.udColor setObject:self.colorArray forKey:_str2];
    [_appDelegate.udColor synchronize];
}

- (void)doneButtonAction {
    [self.tableView reloadData];
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
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"Cell"];
    }
    
    if ([self.colorArray[indexPath.row] isEqual: @"Gray"]) {
        cell.textLabel.textColor = [UIColor grayColor];
    }
    else {
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
    cell.textLabel.text = self.listArray[indexPath.row];

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
        // Delete the row from the data source
        [self.listArray removeObjectAtIndex:indexPath.row];
        [self.colorArray removeObjectAtIndex:indexPath.row];
        
        [_appDelegate.udList setObject:self.listArray forKey:_str1];
        [_appDelegate.udColor setObject:self.colorArray forKey:_str2];
        [_appDelegate.udList synchronize];
        [_appDelegate.udColor synchronize];

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
    
    _index = indexPath;
    [self performSegueWithIdentifier:@"colorChange" sender:self];
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"colorChange"]) {
        SK3ChangeColorViewController *changeColor = [segue destinationViewController];
        changeColor.delegate = self;
    }
}

@end
