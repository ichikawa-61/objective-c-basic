//
//  DetailViewController.m
//  DBTest
//
//  Created by Manami Ichikawa on 3/21/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "DetailViewController.h"
#import "ToDoViewController.h"
#import "FMDB.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.changeTitle.text = self.test;
    self.detailTitle.text = self.de_title;
    self.detailDate.text = self.de_date;
    self.detailContents.text = self.de_contens;
}

- (IBAction)modifyTodo:(id)sender {
    
    
    if(self.detailTitle.text.length==0){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"title"
                             message:@"タイトルを入力してください！！"
                      preferredStyle: UIAlertControllerStyleAlert];
          [alertController addAction:[UIAlertAction actionWithTitle:@"はい"
                               style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction *action) {
                             [self okButtonPushed];
                             }
          ]
         ];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
    }else{
        
        NSInteger todoId   = self.de_id;
        NSString *title    = self.detailTitle.text;
        NSString *contents = self.detailContents.text;
        NSString *deadLine = self.detailDate.text;
        
        NSDate *now = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy/MM/dd"];
        NSString *modified = [formatter stringFromDate:now];
        
    
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
        NSString *dir = [paths
                         objectAtIndex:0];
        NSString *db_path = [dir stringByAppendingPathComponent:@"todo.db"];
        
        FMDatabase *db = [FMDatabase databaseWithPath:db_path];
        
        NSString *sql = @"update tr_todo set todo_title = ?, todo_contents = ?, limit_date = ?, modified = ? where todo_id = ?";
        [db open];
        
        
        [db executeUpdate:sql,title,contents,deadLine,modified,[NSNumber numberWithInteger:todoId]];
        
        
        [db close];
        
        
        
        [self.navigationController popViewControllerAnimated:YES];
    
    }
}
    
- (void)okButtonPushed{
    
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


@end
