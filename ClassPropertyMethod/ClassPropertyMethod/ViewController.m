//
//  ViewController.m
//  ClassPropertyMethod
//
//  Created by Manami Ichikawa on 3/5/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "ViewController.h"
#import "Account.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.



    // ここから
    
        Account *intern1 = [Account new];
        Account *intern2 = [Account new];
        Account *intern3 = [Account new];
            
    // 一人目　プロパティをセット
            intern1.name = @"山田太郎";
            intern1.gender = @"君";
            intern1.language = @"java";
            intern1.age = 24;
    
    // 二人目　プロパティをセット
            intern2.name = @"鈴木花子";
            intern2.gender = @"さん";
            intern2.language = @"Ruby";
            intern2.age = 30;
    //　三人目
            intern3.name = @"田中一郎";
            intern3.gender = @"君";
            intern3.language = @"PHP";
            intern3.age = 22;
    
    // メソッドの呼び出し　[インスタンス　メソッド];
            [intern1 introduce];
            [intern2 introduce];
            [intern3 introduce];

}


    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
        

}


@end
