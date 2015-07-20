//
//  SK3MasterViewController.m
//  Sotuken3
//
//  Created by えばた あや on 2014/11/16.
//  Copyright (c) 2014年 えばた あや. All rights reserved.
//

#import "SK3MasterViewController.h"

@interface SK3MasterViewController () <UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *_objects;
    NSIndexPath *_ip;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SK3MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIColor *pinkbar = [UIColor colorWithRed:254/255.0 green:166/255.0 blue:242/255.0 alpha:1.0];
    self.navigationController.navigationBar.tintColor = pinkbar;
    self.navigationController.toolbar.tintColor = pinkbar;

// ＋ボタン（デフォルト）
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;

    // デリゲートメソッドのクラスを実装
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];

        NSLog(@"array %@", self.array2);
        _objects = [self.array2 mutableCopy];
        NSLog(@"object %@", _objects);
    }
        
    if (!self.fontColorChanged) {
        self.fontColorChanged = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < [_objects count]; i++) {
            [self.fontColorChanged insertObject:@"Black" atIndex:i];
        }
        NSLog(@"ColorList %@", self.fontColorChanged);
    }

    NSLog(@"fontColorChanfed %@", self.fontColorChanged);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	switch(indexPath.row) {
		default:
			return 35;
	}
}

#pragma mark - Button Action

// Cancelボタン（入力画面を閉じる処理）
- (void)addItemViewControllerDidCancel:(SK3AddItemViewController *)controller
{
    NSLog(@"addItemViewControllerDidCancel");
    
    // 画面を閉じるメソッドを呼ぶ
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// Doneボタン（入力画面の入力値の保存、入力画面を閉じる処理）
- (void)addItemViewControllerDidFinish:(SK3AddItemViewController *)controller item:(NSString *)item
{
    NSLog(@"addItemViewControllerDidFinish item:%@",item);
    
//    [self.tableView setEditing:NO];
    
    if ([item length] > 0) {
    
        // 受け取ったitemを配列に格納する
        [_objects insertObject:item atIndex:0];
        [self.fontColorChanged insertObject:@"Black" atIndex:0];
        NSLog(@"insert list %@", _objects);
        NSLog(@"insert color %@", self.fontColorChanged);
        
        // TableViewに行を挿入する
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }

    [self.tableView reloadData];
    
    // 画面を閉じるメソッドを呼ぶ
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)editItemViewControllerDone:(SK3EditItemViewController *)controller item:(NSString *)item {

    NSLog(@"done! item:%@", item);
    
    UITableViewCell *cell =[self.tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:_ip];
    
    if (!cell) {
        // 再利用できない場合は新規で作成
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"Cell"];
    }
    
    if ([item length] > 0) {
        [_objects replaceObjectAtIndex:_ip.row withObject:item];

        cell.textLabel.text = _objects[_ip.row];
        [self.tableView reloadData];
    }
    
    NSLog(@"objecs %@", _objects);
    self.tableView = nil;
}

- (IBAction)saveCheck:(id)sender {
    if (_objects.count == 0) {
        NSLog(@"kara!");
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"リストが空です！"
                              message:nil
                              delegate:nil
                              cancelButtonTitle:nil otherButtonTitles:@"OK！",nil];
        [alert show];
    }
    else {
        [self performSegueWithIdentifier:@"saveData" sender:self];
    }
}

- (IBAction)returnButton:(id)sender {
    if (self.value == 1) {
        [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// ＋が押された時の処理（デフォルト）
//- (void)insertNewObject:(id)sender
//{
//    if (!_objects) {
//        _objects = [[NSMutableArray alloc] init];
//    }
//    [_objects insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//}

#pragma mark - Check Switch

- (void)checkSwichFontColor:(NSString *)fontColor {
    self.fontColorChanged[_ip.row] = fontColor;
}

- (void)switchColorChanged:(UISwitch *)switchCanged {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSLog(@"swich!index! %d", indexPath.row);
    
    if ([self.fontColorChanged[indexPath.row] isEqual:@"Gray"]) {
        switchCanged.on = YES;
    }
    else if ([self.fontColorChanged[indexPath.row] isEqual:@"Black"]){
        switchCanged.on = NO;
    }
}

#pragma mark - Table View

// テーブルに表示するセクション（区切り）の件数を返す
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//  テーブルに表示するデータ件数を返す
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

// テーブルに表示するセルを返す
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 再利用できるセルがあれば再利用する
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (!cell) {
        // 再利用できない場合は新規で作成
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:@"Cell"];
    }

    NSString *object = _objects[indexPath.row];
    
    if ([self.fontColorChanged[indexPath.row] isEqual: @"Gray"]) {
        cell.textLabel.textColor = [UIColor grayColor];
    }
    else {
        cell.textLabel.textColor = [UIColor blackColor];
    }

    cell.textLabel.text = [object description];
 
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    //移動元と移動先に同じセクションの必要があるとき
    if(fromIndexPath.section == toIndexPath.section) {
        if (_objects && toIndexPath.row < _objects.count) {
            
        // 移動元のインデックスから、行データを得る
        NSString *title = [_objects objectAtIndex:fromIndexPath.row];
            
        // いったん移動元の行データを削除する
        [_objects removeObjectAtIndex:fromIndexPath.row];
            
        // destinationIndexPath(移動先のインデックス)へ、行データを挿入する
        [_objects insertObject:title atIndex:toIndexPath.row];
        }
    }
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    _ip = indexPath;
    NSLog(@"indexPath %@", indexPath);
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // セグエのidentifierが"ShowAddItemView"の場合
    if ([[segue identifier] isEqualToString:@"showAddItemView"]) {
        
        // 遷移先のSK3AddItemViewControllerのインスタンスを取得
        SK3AddItemViewController *addItemViewController = (SK3AddItemViewController *)[[[segue destinationViewController] viewControllers] objectAtIndex:0];
        
        // delegateプロパティに self(MasterViewController自身)をセット
        addItemViewController.delegate = self;
    }

    else if ([[segue identifier] isEqualToString:@"showEditItemView"] || [[segue identifier] isEqualToString:@"showEditItemView2"]) {
        SK3EditItemViewController *editItemViewController = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NSString *str = _objects[indexPath.row];
        editItemViewController.editItem = str;
        
        editItemViewController.editField.text = _objects[indexPath.row];
        editItemViewController.delegate = self;
    }
    
    else if ([[segue identifier] isEqualToString:@"saveData"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        SK3SaveViewController *save =[[navigationController viewControllers] objectAtIndex:0];
        save.saveListArray = [_objects copy];
        save.saveColorArray = [self.fontColorChanged copy];
    }
}

@end
