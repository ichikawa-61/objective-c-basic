//
//  ViewController.m
//  UIButton
//
//  Created by Manami Ichikawa on 3/8/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "ViewController.h"
//#import "Sample2ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize background;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //UIImage *img = [UIImage imageNamed:@"img2.jpg"];
    //NSArray *images = @[
    
    UIImage *image1 = [UIImage imageNamed:@"img1.jpg"];
    [background setImage: image1];
    
    //NSArray *images = [NSArray arrayWithObjects:image1, image2, image3, image4, image5, nil];
    x = 0;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated

}

- (IBAction)pushButton:(id)sender {
    
    x++;
    
    if(x>=5){
        x = 0;
        
    }
   
    UIImage *image1 = [UIImage imageNamed:@"img1.jpg"];
    UIImage *image2 = [UIImage imageNamed:@"img2.jpg"];
    UIImage *image3 = [UIImage imageNamed:@"img3.png"];
    UIImage *image4 = [UIImage imageNamed:@"img4.jpg"];
    UIImage *image5 = [UIImage imageNamed:@"img5.jpg"];
    
    switch (x){
        case 0:
            [background setImage: image1];
           break;
        case 1:
           [background setImage: image2];
            break;
        case 2:
            [background setImage: image3];
            break;
        case 3:
            [background setImage: image4];
            break;
        case 4:
            [background setImage: image5];
            break;
    
    }
    
    
    
    
    
    
}
@end
