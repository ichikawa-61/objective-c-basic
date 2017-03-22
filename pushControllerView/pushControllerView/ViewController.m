//
//  ViewController.m
//  pushControllerView
//
//  Created by Manami Ichikawa on 3/13/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

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


- (IBAction)goNext:(id)sender {
    
    SecondViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"secondViewController"];
    ///    secondView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.navigationController pushViewController:secondView animated:YES];
    
    
}
@end
