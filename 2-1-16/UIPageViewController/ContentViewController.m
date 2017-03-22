//
//  ContentViewController.m
//  UIPageViewController
//
//  Created by Manami Ichikawa on 3/10/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()


@end

@implementation ContentViewController

@synthesize labelTitle;
@synthesize pageIndex,title;
//


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.labelTitle.text = self.title;
    //self.lblScreenLabel.text = self.txtTitle;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
