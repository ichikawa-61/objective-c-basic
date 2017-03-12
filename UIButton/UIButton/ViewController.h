//
//  ViewController.h
//  UIButton
//
//  Created by Manami Ichikawa on 3/8/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    int x;
}
@property (weak, nonatomic) IBOutlet UIImageView *background;

- (IBAction)pushButton:(id)sender;

@end

