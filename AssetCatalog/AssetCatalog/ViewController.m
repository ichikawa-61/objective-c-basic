//
//  ViewController.m
//  AssetCatalog
//
//  Created by Manami Ichikawa on 3/8/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // UIImage 生成したインスタンスに画像を入れる
     self.imageView.image = [UIImage imageNamed:@"picture"];
    
   }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
