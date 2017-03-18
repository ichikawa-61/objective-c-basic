//
//  ResisterToDoViewController.m
//  DBTest
//
//  Created by Manami Ichikawa on 3/14/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "ResisterToDoViewController.h"
#import "ToDoViewController.h"
#import "FMDB.h"

@interface ResisterToDoViewController ()

@end

@implementation ResisterToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)saveTask:(id)sender {
    
   
    
    if(self.titleTx.text.length==0){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"title"
                                                                                 message:@"タイトルを入力してください！！"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"はい"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              [self yesButtonPushed];
                                                          }]];
        
        [self presentViewController:alertController animated:YES completion:nil];

    }else{
        
    NSString *title    = self.titleTx.text;
    NSString *contents = self.contents.text;
    NSString *deadLine = self.dateTx.text;
    
    NSDate *now = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd"];
    NSString *created = [formatter stringFromDate:now];
    
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    NSString *dir = [paths
                     objectAtIndex:0];
    NSString *db_path = [dir stringByAppendingPathComponent:@"todo.db"];
    //dbファイルまでのパス テスト用
    NSLog(@"DB-Path : %@",db_path);
    
    FMDatabase *db = [FMDatabase databaseWithPath:db_path];
        
    //?の部分にSQL実行時の引数を割り当て
    NSString *sql = @"INSERT INTO tr_todo (todo_title, todo_contents ,limit_date, created, delete_flg) VALUES (?,?,?,?,?)";
    
    [db open];
        
    
    //引数BOOL型は型の変換が必要　ちなみにIntegerも
        BOOL t = [db executeUpdate:sql,title,contents,deadLine,created,[NSNumber numberWithBool:1]];
    NSLog(@"%d",t);
    
    [db close];
        
        //画面を閉じる
        [self dismissViewControllerAnimated:YES completion:nil];
        //[TodoViewController.tableView reloadData];
    }
    
    
}

- (void)yesButtonPushed{
    //[self dismissViewController:alertController animated:YES completion:nil];
    //NSLog(@"はい");
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if(self.titleTx.isFirstResponder||self.contents.isFirstResponder){
    
        [self.view endEditing:YES];
    }
}
- (IBAction)dateChanged:(id)sender {
    
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    df.dateFormat = @"yyyy/MM/dd";
    self.dateTx.text = [df stringFromDate:self.setDate.date];
}
@end
