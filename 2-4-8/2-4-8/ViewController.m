//
//  ViewController.m
//  2-4-8
//
//  Created by Manami Ichikawa on 3/23/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.


#import "ViewController.h"
#import "PostPictureViewController.h"

@interface ViewController ()

@end

@implementation ViewController
static NSString *const _schemeUrl = @"https://www.instagram.com/";
@synthesize interactionController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([PostPictureViewController canInstagramOpen]) {
        
        
        PostPictureViewController *instagramViewController = [[PostPictureViewController alloc] init];
        
        [instagramViewController openInstagram];
        [self.view addSubview:instagramViewController.view];
        [self addChildViewController:instagramViewController];
        
    } else {
        NSLog(@"ないよ");
    }

    
}







@end
