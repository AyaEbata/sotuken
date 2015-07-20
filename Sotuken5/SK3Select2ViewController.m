//
//  SK3Select2ViewController.m
//  Sotuken5
//
//  Created by えばた あや on 2014/12/27.
//  Copyright (c) 2014年 えばた あや. All rights reserved.
//

#import "SK3Select2ViewController.h"

@interface SK3Select2ViewController () {
    NSMutableArray *_list, *_buttons, *_items, *_count, *_number, *_buttonLabel;
    UIColor *_pink, *_gray;
}

@property (nonatomic) UIButton *yesButton1, *noButton1, *boyButton, *girlButton, *yesButton2, *noButton2, *haruBotton, *natuButton, *akiButton, *huyuButton, *yesButton3, *noButton3, *yesButton4, *noButton4, *yesButton5, *noButton5;  // ここに追加

@end

@implementation SK3Select2ViewController

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
    
    if (!_buttons || !_items) {
        _buttons = [[NSMutableArray alloc] init];
        _items = [[NSMutableArray alloc] init];
    }
    
    NSSet *set = [NSSet setWithArray:self.number];
    self.number = [set allObjects];
    _number = [self.number mutableCopy];

    _pink = [UIColor colorWithRed:1.0 green:0.4353 blue:0.8118 alpha:1.0];
    _gray = [UIColor grayColor];
    
    [self button];
 
    _list = [@[@"コンタクト？", @"男？女？", @"アメニティグッズがある宿？", @"行く季節は？", @"行く季節は？", @"海に行く？", @"写真を撮るのが好き？", @"観光する？"] mutableCopy];  // ここに追加
    _buttonLabel = [@[@"YES", @"NO", @"男", @"女", @"YES", @"NO", @"春", @"夏", @"秋", @"冬", @"YES", @"NO", @"YES", @"NO", @"YES", @"NO"] mutableCopy];  // ここに追加
    _buttons = [@[self.yesButton1, self.noButton1, self.boyButton, self.girlButton, self.yesButton2, self.noButton2, self.haruBotton, self.natuButton, self.akiButton, self.huyuButton, self.yesButton3, self.noButton3, self.yesButton4, self.noButton4, self.yesButton5, self.noButton5] mutableCopy];  // ここに追加
}

- (void)button {
    self.yesButton1 = [UIButton buttonWithType:UIButtonTypeCustom];  // ここに追加
    self.noButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.boyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.girlButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.yesButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.noButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.haruBotton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.natuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.akiButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.huyuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.yesButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.noButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.yesButton4 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.noButton4 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.yesButton5 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.noButton5 = [UIButton buttonWithType:UIButtonTypeCustom];
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
        return _number.count;
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
        
        if (indexPath.row == 0) {  // ここに追加
            [self cellCreate:0 cell:cell1];
        }
        
        else if (indexPath.row == 1) {
            [self cellCreate:1 cell:cell1];
        }
        
        else if (indexPath.row == 2) {
            [self cellCreate:2 cell:cell1];
        }
        
        else if (indexPath.row == 3) {
            [self cellCreate:3 cell:cell1];
        }

        else if (indexPath.row == 4) {
            [self cellCreate:4 cell:cell1];
        }

        else if (indexPath.row == 5) {
            [self cellCreate:5 cell:cell1];
        }

        else if (indexPath.row == 6) {
            [self cellCreate:6 cell:cell1];
        }

        else if (indexPath.row == 7) {
            [self cellCreate:7 cell:cell1];
        }

        return cell1;
    }
    
    return cell2;
}

- (void)cellCreate:(int)index cell:(UITableViewCell *)cell {
    int a = [[_number objectAtIndex:index] intValue];
    
    cell.textLabel.text = _list[a];
    [self createButton:a buttonName1:_buttonLabel[a*2] buttonName2:_buttonLabel[a*2+1] button1:_buttons[a*2] button2:_buttons[a*2+1] cell:cell];
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
    
    if (_number.count >= 1 && [NSIndexPath indexPathForRow:0 inSection:0]) {  // ここに追加
        [self insertItem:0 sender:sender];
    }
    
    if (_number.count >= 2 && [NSIndexPath indexPathForRow:1 inSection:0]) {
        [self insertItem:1 sender:sender];
    }

    if (_number.count >= 3 && [NSIndexPath indexPathForRow:2 inSection:0]) {
        [self insertItem:2 sender:sender];
    }

    if (_number.count >= 4 && [NSIndexPath indexPathForRow:3 inSection:0]) {
        [self insertItem:3 sender:sender];
    }

    if (_number.count >= 5 && [NSIndexPath indexPathForRow:4 inSection:0]) {
        [self insertItem:4 sender:sender];
    }

    if (_number.count >= 6 && [NSIndexPath indexPathForRow:5 inSection:0]) {
        [self insertItem:5 sender:sender];
    }

    if (_number.count >= 7 && [NSIndexPath indexPathForRow:6 inSection:0]) {
        [self insertItem:6 sender:sender];
    }

    if (_number.count >= 8 && [NSIndexPath indexPathForRow:7 inSection:0]) {
        [self insertItem:7 sender:sender];
    }
}

- (void)insertItem:(int)index sender:(id)sender {
    int a = [[_number objectAtIndex:index] intValue];
    NSLog(@"int a %d", a);
    
    NSArray *items = @[@"バスタオル", @"シャンプー・リンス", @"ボディーソープ・洗顔", @"ドライヤー", @"歯ブラシ・歯磨き粉", @"折り畳み傘", @"ポケットティッシュ", @"携帯用バッテリー", @"整髪料", @"フェイスタオル", @"パジャマ", @"くし", @"ドライヤー"];
    
    if (!_count) {
        _count = [[NSMutableArray alloc] init];
    }
    
    if (a == 0) {  // ここに追加
        if (sender == self.yesButton1) {
            [self.noButton1 setTitleColor:_gray forState:UIControlStateNormal];
            
            [_items addObject:@"コンタクト（液、ケース）"];
            
            [_count insertObject:@"situmon1" atIndex:0];
            NSLog(@"items %@", _items);
        }
        else if (sender == self.noButton1){
            [self.yesButton1 setTitleColor:_gray forState:UIControlStateNormal];
            
            [_items removeObject:@"コンタクト（液、ケース）"];
            
            [_count insertObject:@"situmon1" atIndex:0];
            NSLog(@"items %@", _items);
        }
    }
    
    else if (a == 1) {
        if (sender == self.boyButton) {
            [self.girlButton setTitleColor:_gray forState:UIControlStateNormal];
        
            [_items addObject:@"カミソリ"];
            [_items removeObject:@"生理用品"];
            [_items removeObject:@"化粧品・スキンケア用品（小分け）"];
        
            [_count insertObject:@"situmon2" atIndex:0];
            NSLog(@"items %@", _items);
        }
        else if (sender == self.girlButton){
            [self.boyButton setTitleColor:_gray forState:UIControlStateNormal];
        
            [_items removeObject:@"カミソリ"];
            [_items addObject:@"生理用品"];
            [_items addObject:@"化粧品・スキンケア用品（小分け）"];
        
            [_count insertObject:@"situmon2" atIndex:0];
            NSLog(@"items %@", _items);
        }
    }

    else if (a == 2) {
        if (sender == self.yesButton2) {
            [self.noButton2 setTitleColor:_gray forState:UIControlStateNormal];
            
            for (int item = 0; item <= 12; item++) {
                [_items removeObject:items[item]];
            }
            
            [_count insertObject:@"situmon3" atIndex:0];
            NSLog(@"items %@", _items);
        }
        else if (sender == self.noButton2){
            [self.yesButton2 setTitleColor:_gray forState:UIControlStateNormal];
            
            for (int item = 0; item <= 12; item++) {
                [_items addObject:items[item]];
            }

            [_count insertObject:@"situmon3" atIndex:0];
            NSLog(@"items %@", _items);
        }
    }

    else if (a == 3) {
        if (sender == self.haruBotton) {
            [self.natuButton setTitleColor:_gray forState:UIControlStateNormal];
            
            [_items addObject:@"花粉症対策グッズ"];
            [_items removeObject:@"日焼け止め"];
            [_items removeObject:@"虫除けスプレー"];
            
            [_count insertObject:@"situmon4" atIndex:0];
            NSLog(@"items %@", _items);
        }
        else if (sender == self.natuButton){
            [self.haruBotton setTitleColor:_gray forState:UIControlStateNormal];
            
            [_items removeObject:@"花粉症対策グッズ"];
            [_items addObject:@"日焼け止め"];
            [_items addObject:@"虫除けスプレー"];
            
            [_count insertObject:@"situmon4" atIndex:0];
            NSLog(@"items %@", _items);
        }
    }

    else if (a == 4) {
        if (sender == self.akiButton) {
            [self.huyuButton setTitleColor:_gray forState:UIControlStateNormal];
            
            [_items addObject:@"薄手の羽織れる上着"];
            [_items removeObject:@"防寒具"];
            [_items removeObject:@"ホッカイロ"];
            [_items removeObject:@"マスク"];
            
            [_count insertObject:@"situmon5" atIndex:0];
            NSLog(@"items %@", _items);
        }
        else if (sender == self.huyuButton){
            [self.akiButton setTitleColor:_gray forState:UIControlStateNormal];
            
            [_items removeObject:@"薄手の羽織れる上着"];
            [_items addObject:@"防寒具"];
            [_items addObject:@"ホッカイロ"];
            [_items addObject:@"マスク"];
            
            [_count insertObject:@"situmon5" atIndex:0];
            NSLog(@"items %@", _items);
        }
    }

    else if (a == 5) {
        if (sender == self.yesButton3) {
            [self.noButton3 setTitleColor:_gray forState:UIControlStateNormal];
            
            [_items addObject:@"水着"];
            [_items addObject:@"ビーチサンダル"];
            
            [_count insertObject:@"situmon6" atIndex:0];
            NSLog(@"items %@", _items);
        }
        else if (sender == self.noButton3){
            [self.yesButton3 setTitleColor:_gray forState:UIControlStateNormal];
            
            [_items removeObject:@"水着"];
            [_items removeObject:@"ビーチサンダル"];
            
            [_count insertObject:@"situmon6" atIndex:0];
            NSLog(@"items %@", _items);
        }
    }

    else if (a == 6) {
        if (sender == self.yesButton4) {
            [self.noButton4 setTitleColor:_gray forState:UIControlStateNormal];
            
            [_items addObject:@"カメラ"];
            [_items addObject:@"カメラの充電器"];
            
            [_count insertObject:@"situmon7" atIndex:0];
            NSLog(@"items %@", _items);
        }
        else if (sender == self.noButton4){
            [self.yesButton4 setTitleColor:_gray forState:UIControlStateNormal];
            
            [_items removeObject:@"カメラ"];
            [_items removeObject:@"カメラの充電器"];
            
            [_count insertObject:@"situmon7" atIndex:0];
            NSLog(@"items %@", _items);
        }
    }

    else if (a == 7) {
        if (sender == self.yesButton5) {
            [self.noButton5 setTitleColor:_gray forState:UIControlStateNormal];
            
            [_items addObject:@"小さめの鞄"];
            [_items addObject:@"ガイドブック"];
            
            [_count insertObject:@"situmon8" atIndex:0];
            NSLog(@"items %@", _items);
        }
        else if (sender == self.noButton5){
            [self.yesButton5 setTitleColor:_gray forState:UIControlStateNormal];
            
            [_items removeObject:@"小さめの鞄"];
            [_items removeObject:@"ガイドブック"];
            
            [_count insertObject:@"situmon8" atIndex:0];
            NSLog(@"items %@", _items);
        }
    }
}

- (IBAction)button:(id)sender {
    NSLog(@"完了");
    
    NSArray *a1 = [_count copy];
    NSSet *set = [NSSet setWithArray:a1];
    a1 = [set allObjects];
    a1 = [a1 sortedArrayUsingSelector:@selector(compare:)];
    
    NSArray *a2 = @[@"situmon1", @"situmon2", @"situmon3", @"situmon4", @"situmon5", @"situmon6", @"situmon7", @"situmon8"];  // ここに追加

    NSMutableArray *a3 = [[NSMutableArray alloc] init];
    for (int i = 0; i < _number.count; i++) {
        int a = [[_number objectAtIndex:i] intValue];
        [a3 insertObject:a2[a] atIndex:0];
    }
    a2 = [a3 sortedArrayUsingSelector:@selector(compare:)];

    NSLog(@"%@", a1);
    NSLog(@"%@", a2);
    
    if ([a1 isEqualToArray:a2]) {
        self.array4 = [_items copy];
        NSSet *setArray = [NSSet setWithArray:self.array4];
        self.array4 = [setArray allObjects];
        NSLog(@"Array = %@", self.array4);
        
        [self performSegueWithIdentifier:@"insertItems" sender:self];
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
    if ([[segue identifier] isEqualToString:@"insertItems"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        SK3MasterViewController *master =[[navigationController viewControllers] objectAtIndex:0];
        
        NSArray *ketugou = [self.array3 arrayByAddingObjectsFromArray:self.array4];
        master.array2 = ketugou;
        
        master.value = 1;
    }
}

@end