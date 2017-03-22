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
#import "Todo.h"
#import "DetailViewController.h"

@interface TodoViewController ()

@property (nonatomic, strong) NSMutableArray *list;

@end

@implementation TodoViewController{
    
    
}
@synthesize list;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //初期化
      NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    NSString *dir = [paths
                     objectAtIndex:0];
    NSString *db_path = [dir stringByAppendingPathComponent:@"todo.db"];
   
    FMDatabase *db = [FMDatabase databaseWithPath:db_path];
    NSString *sql = @"CREATE TABLE IF NOT EXISTS  tr_todo(todo_id INTEGER PRIMARY KEY AUTOINCREMENT, todo_title TEXT, todo_contents TEXT, created DATE, modified DATE, limit_date DATE, delete_flg BOOL); ";
    [db open];
    [db executeUpdate:sql];
    [db close];
        
    
    
}


- (void)viewWillAppear:(BOOL)animated{
    
    
    [super viewWillAppear:animated];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    NSString *dir = [paths
                     objectAtIndex:0];
    NSString *db_path = [dir stringByAppendingPathComponent:@"todo.db"];
    
    FMDatabase *db = [FMDatabase databaseWithPath:db_path];
    NSString *sqlite = @"select* from tr_todo where delete_flg = ? ORDER BY limit_date ASC ";
    [db open];
    FMResultSet*  results = [db executeQuery:sqlite,[NSNumber numberWithBool:1]];
    
    NSMutableArray* lists = [[NSMutableArray alloc] initWithCapacity:0];
//       NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"yyyy/MM/dd"];
    while ([results next]){
        Todo*todo = [[Todo alloc] init];
        todo.todoId     = [results intForColumn:@"todo_id"];
        todo.todoTitle  = [results stringForColumn:@"todo_title"];
        todo.todoContents  = [results stringForColumn:@"todo_contents"];
        todo.limitDate  = [results stringForColumn:@"limit_date"];
        
       
        [lists addObject:todo];
        //        // 出力
        //
        self.list = lists;
        
    }
    
    [results close];
    [db close];

    
    [self.tableView reloadData]; //テーブルをリロードして更新
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

    return self.list.count;
}



//行に表示する内容が決まる

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"ToDoItemRow";
    CostomCell *cell = (CostomCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    
    Todo *todo = [self.list objectAtIndex:indexPath.row];
    cell.titleLabel.text = todo.todoTitle;
    cell.dateLabel.text = todo.limitDate;
    
   
        return cell;
}



#pragma -





- (IBAction)goToResister:(id)sender {
    
    ResisterToDoViewController *ResisterView = [self.storyboard instantiateViewControllerWithIdentifier:@"ResisterView"];
      [self presentViewController:ResisterView animated:YES completion:nil];
}





//セルをタップすると呼ばれる
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //self.selectedIndexPath = indexPath;
    // セグエを呼び出して画面遷移。
    [self performSegueWithIdentifier:@"pushDetailView" sender:self];
    
    
}

//segue が動く時に遷移先のviewcontrollerに伝えるメソッド
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([segue.identifier  isEqualToString:@"pushDetailView"]) {
        // 遷移先を取得
        DetailViewController *detailViewController = segue.destinationViewController;
        
        //選択された行の情報取得
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        //listの中にあるrow番目の情報を格納
        Todo*todo =[self.list objectAtIndex:indexPath.row];
        //detailViewController.changeTitle.text = todo.todoTitle;
        detailViewController.test = todo.todoTitle;
        detailViewController.de_title = todo.todoTitle;
        detailViewController.de_contens = todo.todoContents;
        detailViewController.de_date = todo.limitDate;
        detailViewController.de_id = todo.todoId;
        
        
        //NSLog(@"%@",todo.todoContents);
        //[ todo. objectAtIndex:indexPath.row];
    }
}



//デリゲートは、tableView:editingStyleForRowAtIndexPath:メソッドで行の編集スタイルを返すことによって、コントロールを割り当て。削除タップでViewコントローラーがTable ViewからtableView:commitEditingStyle:forRowAtIndexPath:メッセージを受信。
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    //セル削除で引数にindexPathを渡して、removeRowメソッドを実行
    if( editingStyle == UITableViewCellEditingStyleDelete )
    {
        [self removeRow:indexPath];
    }
}





//受け取った引数から、row番目と行を割り出し、削除
- (void)removeRow:(NSIndexPath*)indexPath
{
   
    NSInteger num;
    
    Todo*todo =[self.list objectAtIndex:indexPath.row];
    
    //クリックされたrowをlistの中から削除　これを忘れるとdeleteRowsAtIndexPathsメソッドで落ちる
    [self.list removeObjectAtIndex: indexPath.row];
    
    //セルが消えるアニメーション
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]  withRowAnimation:UITableViewRowAnimationFade];
    
    
    //DBの処理を実装。クリックしたrowのDB上のidを取得してdeleteRowメソッド
    num = todo.todoId;
    [self deleteRow :num];
    
    
    
}




//データベースの値削除するための関数　indexPathを受け取って行を認識する
//- (void)deleteRow :(NSIndexPath*)indexPath{
- (void)deleteRow :(NSInteger)num{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    NSString *dir = [paths
                     objectAtIndex:0];
    NSString *db_path = [dir stringByAppendingPathComponent:@"todo.db"];
    
    FMDatabase *db  = [FMDatabase databaseWithPath:db_path];
    NSString *sql = @"update tr_todo set delete_flg = ? where todo_id = ?";
    
    
    [db open];
    [db executeUpdate:sql,[NSNumber numberWithBool:0],[NSNumber numberWithInteger:num]];
    [db close];
    
    
}

@end

