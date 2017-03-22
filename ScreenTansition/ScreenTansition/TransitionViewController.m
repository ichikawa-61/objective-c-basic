//
//  ViewController.m
//  ScreenTansition
//
//  Created by Manami Ichikawa on 3/10/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "TransitionViewController.h"
#import "SecondViewController.h"

@interface TransitionViewController ()

@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goNext:(id)sender {
    
    //SecondViewControllerクラスにインスタンスを作ってストーリーボードのviewcontrollerを当てはめる
    SecondViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"secondView"];
///    secondView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:secondView animated:YES completion:nil];
    
}


@end
