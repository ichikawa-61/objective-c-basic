//
//  ViewController.m
//  DBTest
//
//  Created by Manami Ichikawa on 3/13/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "ToDoViewController.h"
#import "ResisterToDoViewController.h"
#import "FMDB.h"
#import "CostomCell.h"

@interface TodoViewController ()

@property (nonatomic) NSMutableArray *tasks;

@end

@implementation TodoViewController{

//データベースから取り出しtitleを格納
@private NSMutableArray *titleArry;
@private NSMutableArray *dateArry;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //初期化
    titleArry = [[NSMutableArray alloc] init ];
    dateArry = [[NSMutableArray alloc] init ];
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
        NSString *dir = [paths
                         objectAtIndex:0];
        NSString *db_path = [dir stringByAppendingPathComponent:@"todo.db"];
            //NSLog(@"%@", db_path);
                             FMDatabase *db = [FMDatabase databaseWithPath:db_path];
        NSString *sql = @"CREATE TABLE IF NOT EXISTS  tr_todo(todo_id INTEGER PRIMARY KEY AUTOINCREMENT, todo_title TEXT, todo_contents TEXT, created DATE, modified DATE, limit_date DATE, delete_flg BOOL); ";
        [db open];
        [db executeUpdate:sql];
        [db close];
    
    
    [self selectTitle:titleArry];
    [self selectDate:dateArry];
    
//    FMResultSet *results = [db executeQuery:list];
//    NSLog(@"%@",results);
//    while ([results next]) {
//        NSLog(@"%d %@", [results intForColumn:@"todo_id"], [results stringForColumn:@"todo_title"]);
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    titleArry = [[NSMutableArray alloc] init ];
//    dateArry = [[NSMutableArray alloc] init ];
//    
//    [self selectTitle:titleArry];
//    [self selectDate:dateArry];
//    
    
    [_tableView reloadData]; //テーブルをリロードして更新
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma -Table view datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //データベースのタイトルの数だけ行を作る
    return titleArry.count;
   }


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"ToDoItemRow";
    CostomCell *cell = (CostomCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] ;
//    }
    
   cell.titleLabel.text = [titleArry objectAtIndex:indexPath.row];
   cell.dateLabel.text  = [dateArry objectAtIndex:indexPath.row];
    return cell;
}



#pragma - 


//タイトルを取得する

- (NSMutableArray *)selectTitle :(NSMutableArray *)array{
     
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    NSString *dir = [paths
                     objectAtIndex:0];
    NSString *db_path = [dir stringByAppendingPathComponent:@"todo.db"];
    NSLog(@"テスト%@", db_path);
    FMDatabase *db  = [FMDatabase databaseWithPath:db_path];
    [db open];
    FMResultSet *list = [db executeQuery:@"select todo_title from tr_todo"];

    
    NSString* titleData;
    while ([list next]){
        
        // 出力
        titleData = [list stringForColumn:@"todo_title"];
        [array addObject:titleData];
            }
    
    //NSLog(@"%@",array);
    //NSLog(@"%@",titleArry);
    [db close];
    return array;
   
}

- (IBAction)goToResister:(id)sender {
    
    ResisterToDoViewController *ResisterView = [self.storyboard instantiateViewControllerWithIdentifier:@"ResisterView"];
    ///    secondView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:ResisterView animated:YES completion:nil];
}



//デリゲートは、tableView:editingStyleForRowAtIndexPath:メソッドで行の編集スタイルを返すことによって、コントロールを割り当て。削除タップでViewコントローラーがTable ViewからtableView:commitEditingStyle:forRowAtIndexPath:メッセージを受信。
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{

    
    
    //セル削除で引数にindexPathを渡して、removeRowメソッドを実行
    if( editingStyle == UITableViewCellEditingStyleDelete )
    {
        [self removeRow:indexPath];
    }
}



//受け取った引数から、row番目と行を割り出し、titleArryとdetaArryの配列要素を削除
- (void)removeRow:(NSIndexPath*)indexPath
    {
        //選択したrow番目の配列要素を削除する。
        NSInteger row = [indexPath row];
        [titleArry removeObjectAtIndex: row];
        [dateArry removeObjectAtIndex: row];
        
        
        //セルが消えるアニメーション
        [_tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]  withRowAnimation:UITableViewRowAnimationFade];
        
        
       
        //[DataModels drop_table];
        [self deleteRow : indexPath];
        
        
        
}


- (void)deleteRow :(NSIndexPath*)indexPath{
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    NSString *dir = [paths
                     objectAtIndex:0];
    NSString *db_path = [dir stringByAppendingPathComponent:@"todo.db"];
    
    FMDatabase *db  = [FMDatabase databaseWithPath:db_path];
    [db open];
    
    
    //whereの部分実装してない
    NSString *sql = @"update tr_todo set delete_flg = ? where  ?";
    
    [db executeUpdate:sql,[NSNumber numberWithBool:0]];

}



//期限を取得する

- (NSMutableArray *)selectDate :(NSMutableArray *)array{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    NSString *dir = [paths
                     objectAtIndex:0];
    NSString *db_path = [dir stringByAppendingPathComponent:@"todo.db"];
    //NSLog(@"テスト%@", db_path);
    FMDatabase *db  = [FMDatabase databaseWithPath:db_path];
    [db open];
    FMResultSet *list = [db executeQuery:@"select limit_date from tr_todo"];
    //NSLog(@"日付%@",list);

    
    NSDate* dateData;
   
    while ([list next]){
        
        // 出力
    dateData = [list dateForColumn:@"limit_date"];
         //NSLog(@"日付%@",array);
        NSLog(@"%@",dateData);
        [array addObject:dateData];
        
    }
   
    
    
    
    [db close];
    return array;
    
}


@end
