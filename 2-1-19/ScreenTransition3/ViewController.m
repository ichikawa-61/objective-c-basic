//
//  ViewController.m
//  ScreenTransition3
//
//  Created by Manami Ichikawa on 3/12/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)getText:(id)sender {
    [self performSegueWithIdentifier:@"passSegue" sender:self];
}

//Segueで画面遷移時に必ず呼ばれるメソッド
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
//仮に、Segueが複数あった場合、どのViewControllerが呼ばれているのか選別するために、条件分岐する。
    if ([segue.identifier isEqualToString:@"passSegue"]){
        SecondViewController *secondViewController = segue.destinationViewController;
        Connector *connectorClass = [[Connector alloc]init];
        connectorClass.wordBeginPassed = TextField.text;
        
        //インスタンス変数から、SecondViewControllerクラスインスタンスのプロパティに値を渡す
        secondViewController.connectorClass = connectorClass;
    }
}

@end
