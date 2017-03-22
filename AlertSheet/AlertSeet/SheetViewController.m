//
//  ViewController.m
//  AlertSeet
//
//  Created by Manami Ichikawa on 3/12/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "SheetViewController.h"

@interface SheetViewController ()

@end

@implementation SheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)pushBtn:(id)sender {
    
        
        //タイトルとメッセージ表示
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"タイトル"
                                                        message:@"action sheet."
                                                        preferredStyle:UIAlertControllerStyleActionSheet];
        
        //選択肢を表示
        UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"Twitter"
                                                        style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                                                        NSLog(@"You pressed Twitter");
                                                        }];
        
        UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"Facebook"
                                                        style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                        NSLog(@"You pressed Facebook");
                                                        }];
        
        UIAlertAction *thirdAction = [UIAlertAction actionWithTitle:@"Line"
                                      
                                                        style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                                                        NSLog(@"You pressed Line");
                                                        }];
        
        [alert addAction:firstAction];
        [alert addAction:secondAction];
        [alert addAction:thirdAction];
        
        
        [self presentViewController:alert animated:YES completion:nil];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
