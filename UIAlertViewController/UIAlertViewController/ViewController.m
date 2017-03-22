//
//  ViewController.m
//  UIAlertViewController
//
//  Created by Manami Ichikawa on 3/7/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//storyboadで関連付け=>buttonからcontrollerView PushButtonメソッド
- (IBAction)PushButton:(id)sender {
    
    //アラートオブジェクト
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"タイトル"
                                          message:@"メッセージ"
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"はい"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self yesButtonPushed];
                                                      }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"いいえ"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          // cancelボタンが押された時の処理
                                                          [self noButtonPushed];
                                                      }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)yesButtonPushed {
    NSLog(@"はい");
}
- (void)noButtonPushed {
    NSLog(@"いいえ");
}


@end
