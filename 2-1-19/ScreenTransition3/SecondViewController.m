//
//  SecondViewController.m
//  ScreenTransition3
//
//  Created by Manami Ichikawa on 3/12/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize connectorClass;


//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.Lb.text = connectorClass.wordBeginPassed;

}


- (IBAction)goBack:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}




@end
