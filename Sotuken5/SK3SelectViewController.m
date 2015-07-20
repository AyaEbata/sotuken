//
//  SK3SelectViewController.m
//  Sotuken4
//
//  Created by えばた あや on 2014/12/02.
//  Copyright (c) 2014年 えばた あや. All rights reserved.
//

#import "SK3SelectViewController.h"

@interface SK3SelectViewController () {
    NSMutableArray *_list, *_buttons, *_items, *_count, *_number;
    UIColor *_pink, *_gray;
}

@property (nonatomic) UIButton *yesButton1, *noButton1, *yesButton2, *noButton2, *yesButton3, *noButton3, *yesButton4, *noButton4, *harunatuButton, *akihuyuButton;  // ここに追加

@end

@implementation SK3SelectViewController

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

    if (!_list || !_buttons || !_items) {
        _list = [[NSMutableArray alloc] init];
        _buttons = [[NSMutableArray alloc] init];
        _items = [[NSMutableArray alloc] init];
    }
    
    _list = [@[@"最低限の持ち物にする？", @"裸眼？", @"車に乗る？", @"学生？", @"いつ頃行く？"] mutableCopy];  // ここに追加
    _items = [@[@"着替え", @"下着", @"充電器", @"常備薬", @"健康保険証", @"キャッシュカード", @"現金", @"クレジットカード", @"携帯電話"] mutableCopy];
    
    _pink = [UIColor colorWithRed:1.0 green:0.4353 blue:0.8118 alpha:1.0];
    _gray = [UIColor grayColor];
    
    [self button];

    _buttons = [@[self.yesButton1, self.noButton1, self.yesButton2, self.noButton2, self.yesButton3, self.noButton3, self.yesButton4, self.noButton4, self.harunatuButton, self.akihuyuButton] mutableCopy];  // ここに追加
}

- (void)button {
    self.yesButton1 = [UIButton buttonWithType:UIButtonTypeCustom];  // ここに追加
    self.noButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.yesButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.noButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.yesButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.noButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.yesButton4 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.noButton4 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.harunatuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.akihuyuButton = [UIButton buttonWithType:UIButtonTypeCustom];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (section == 0) {
        return _list.count;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	switch(indexPath.row) {
		default:
			return 32;
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier1 = @"Cell1";
    static NSString *CellIdentifier2 = @"Cell2";
    
    NSIndexPath *ip2 = [NSIndexPath indexPathForRow:0 inSection:1];
    UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1 forIndexPath:indexPath];
    UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier2 forIndexPath:ip2];

    cell1.selectionStyle = UITableViewCellSelectionStyleNone;
    cell2.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (cell1 == nil) {
        cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1];
    }
    
    // Configure the cell...
    if (indexPath.section == 0) {
        cell1.textLabel.text = _list[indexPath.row];
       
        if (indexPath.row == 0) { // 最低限の持ち物にする？ // ここに追加
            [self createButton:0 buttonName1:@"YES" buttonName2:@"NO" button1:self.yesButton1 button2:self.noButton1 cell:cell1];
        }

        else if (indexPath.row == 1) { // 眼鏡？
            [self createButton:1 buttonName1:@"YES" buttonName2:@"NO" button1:self.yesButton2 button2:self.noButton2 cell:cell1];
        }

        else if (indexPath.row == 2) {  // 車に乗る？
            [self createButton:2 buttonName1:@"YES" buttonName2:@"NO" button1:self.yesButton3 button2:self.noButton3 cell:cell1];
        }
        
        else if (indexPath.row == 3) {  // 学生？
            [self createButton:3 buttonName1:@"YES" buttonName2:@"NO" button1:self.yesButton4 button2:self.noButton4 cell:cell1];
        }

        else if (indexPath.row == 4) {  // いつ頃行く？
            [self createButton:4 buttonName1:@"春or夏" buttonName2:@"秋or冬" button1:self.harunatuButton button2:self.akihuyuButton cell:cell1];
        }

        return cell1;
    }
    
    return cell2;
}

- (void)createButton:(int)index buttonName1:(NSString *)buttonName1 buttonName2:(NSString *)buttonName2 button1:(UIButton *)button1 button2:(UIButton *)button2 cell:(UITableViewCell *)cell {
    index = index * 2;
    [self insertButton:index cell:cell button1:buttonName1 button2:buttonName2];
    
    [button1 addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
    [button2 addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)insertButton:(int)n cell:(UITableViewCell *)cell button1:(NSString *)button1 button2:(NSString *)button2 {
    [_buttons[n] setFrame:CGRectMake(220, 7, 50, 20)];
    [_buttons[n] setTitle:button1 forState:UIControlStateNormal];
    
    [_buttons[n+1] setFrame:CGRectMake(268, 7, 50, 20)];
    [_buttons[n+1] setTitle:button2 forState:UIControlStateNormal];

    for (int i = n; i <= n+1; i++) {
        [_buttons[i] setFont:[UIFont systemFontOfSize:14.0]];
        [_buttons[i] setTitleColor:_gray forState:UIControlStateNormal];
        [cell addSubview:_buttons[i]];
    }
}

#pragma mark - button

- (void)selectButton:(id)sender {
    [sender setTitleColor:_pink forState:UIControlStateNormal];
    
    if (!_count || !_number) {
        _count = [[NSMutableArray alloc] init];
        _number = [[NSMutableArray alloc] init];
    }

    if ([NSIndexPath indexPathForRow:0 inSection:0]) {  // ここに追加
        if (sender == self.yesButton1) {
            [self.noButton1 setTitleColor:_gray forState:UIControlStateNormal];
            
            [_number removeObject:[NSNumber numberWithInteger:1]];
            [_number removeObject:[NSNumber numberWithInteger:2]];
            [_number removeObject:[NSNumber numberWithInteger:6]];
            [_number removeObject:[NSNumber numberWithInteger:7]];
            
            [_count insertObject:@"situmon1" atIndex:0];
            NSLog(@"items %@", _items);
        }
        else if (sender == self.noButton1){
            [self.yesButton1 setTitleColor:_gray forState:UIControlStateNormal];
            
            [_number addObject:[NSNumber numberWithInteger:1]];
            [_number addObject:[NSNumber numberWithInteger:2]];
            [_number addObject:[NSNumber numberWithInteger:6]];
            [_number addObject:[NSNumber numberWithInteger:7]];

            [_count insertObject:@"situmon1" atIndex:0];
            NSLog(@"items %@", _items);
        }
    }

    if ([NSIndexPath indexPathForRow:1 inSection:0]) {
        if (sender == self.yesButton2) {
            [self.noButton2 setTitleColor:_gray forState:UIControlStateNormal];
            
            [_items removeObject:@"眼鏡"];
            [_number removeObject:[NSNumber numberWithInteger:0]];

            [_count insertObject:@"situmon2" atIndex:0];
            NSLog(@"items %@", _items);
        }
        else if (sender == self.noButton2){
            [self.yesButton2 setTitleColor:_gray forState:UIControlStateNormal];
            
            [_items addObject:@"眼鏡"];
            [_number addObject:[NSNumber numberWithInteger:0]];

            [_count insertObject:@"situmon2" atIndex:0];
            NSLog(@"items %@", _items);
        }
    }
    
    if ([NSIndexPath indexPathForRow:2 inSection:0]) {
        if (sender == self.yesButton3) {
            [self.noButton3 setTitleColor:_gray forState:UIControlStateNormal];
            
            [_items addObject:@"免許証"];
            [_items addObject:@"ETCカード"];
            [_items removeObject:@"航空券・乗車券"];

            [_count insertObject:@"situmon3" atIndex:0];
            NSLog(@"items %@", _items);
        }
        else if (sender == self.noButton3){
            [self.yesButton3 setTitleColor:_gray forState:UIControlStateNormal];
            
            [_items removeObject:@"免許証"];
            [_items removeObject:@"ETCカード"];
            [_items addObject:@"航空券・乗車券"];

            [_count insertObject:@"situmon3" atIndex:0];
            NSLog(@"items %@", _items);
        }
    }

    if ([NSIndexPath indexPathForRow:3 inSection:0]) {
        if (sender == self.yesButton4) {
            [self.noButton4 setTitleColor:_gray forState:UIControlStateNormal];
            
            [_items addObject:@"学生証"];
            
            [_count insertObject:@"situmon4" atIndex:0];
            NSLog(@"items %@", _items);
        }
        else if (sender == self.noButton4){
            [self.yesButton4 setTitleColor:_gray forState:UIControlStateNormal];
            
            [_items removeObject:@"学生証"];
            
            [_count insertObject:@"situmon4" atIndex:0];
            NSLog(@"items %@", _items);
        }
    }

    if ([NSIndexPath indexPathForRow:4 inSection:0]) {
        if (sender == self.harunatuButton) {
            [self.akihuyuButton setTitleColor:_gray forState:UIControlStateNormal];

            if (self.noButton1.currentTitleColor == _pink && self.harunatuButton.currentTitleColor == _pink) {
                [_number addObject:[NSNumber numberWithInteger:3]];
                [_number removeObject:[NSNumber numberWithInteger:4]];
                [_number addObject:[NSNumber numberWithInteger:5]];
            }
            
            [_count insertObject:@"situmon5" atIndex:0];
            NSLog(@"items %@", _items);
        }
        else if (sender == self.akihuyuButton){
            [self.harunatuButton setTitleColor:_gray forState:UIControlStateNormal];
            
            if (self.noButton1.currentTitleColor == _pink && self.akihuyuButton.currentTitleColor == _pink) {
                [_number removeObject:[NSNumber numberWithInteger:3]];
                [_number addObject:[NSNumber numberWithInteger:4]];
                [_number removeObject:[NSNumber numberWithInteger:5]];
            }

            [_count insertObject:@"situmon5" atIndex:0];
            NSLog(@"items %@", _items);
        }
    }
}

- (IBAction)button:(id)sender {
    NSLog(@"次へ");
    
    NSArray *array1 = [_count copy];
    NSSet *set = [NSSet setWithArray:array1];
    array1 = [set allObjects];
    array1 = [array1 sortedArrayUsingSelector:@selector(compare:)];
    
    NSArray *array2 = @[@"situmon1", @"situmon2", @"situmon3", @"situmon4", @"situmon5"];  // ここに追加
    
    NSLog(@"%@", array1);
    NSLog(@"%@", array2);

    if ([array1 isEqualToArray:array2]) {
        self.array1 = [_items copy];
        NSSet *setArray = [NSSet setWithArray:self.array1];
        self.array1 = [setArray allObjects];
        NSLog(@"Array = %@", self.array1);

        if (_number.count == 0) {
            [self performSegueWithIdentifier:@"kara" sender:self];
        }
        [self performSegueWithIdentifier:@"nextSelect" sender:self];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"全ての項目にチェックをしてください！"
                              message:nil
                              delegate:nil
                              cancelButtonTitle:nil otherButtonTitles:@"OK！",nil];
        [alert show];
    }
}

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

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"nextSelect"]) {
        SK3Select2ViewController *select2 =[segue destinationViewController];
        
        select2.array3 = self.array1;
        select2.number = [_number mutableCopy];
        
        NSLog(@"number %@", _number);
    }
    
    else if ([[segue identifier] isEqualToString:@"kara"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        SK3MasterViewController *master =[[navigationController viewControllers] objectAtIndex:0];
        
        master.array2 = self.array1;
    }
}

@end