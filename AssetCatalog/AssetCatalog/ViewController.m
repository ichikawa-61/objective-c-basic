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
    
    self.image.image = [UIImage imageNamed:@"Image"];
    
    // UIImageView 初期化
    
    //UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
    
    
    
    //UIImageViewのサイズの変更
    
//    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//    
//    self.image.frame = rect;
//    
    self.image.layer.masksToBounds = YES;
    self.image.layer.cornerRadius  = 10;
    
//    self.image.contentMode = UIViewContentModeScaleAspectFit;
    
//    [self.view addSubview:self.image];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
