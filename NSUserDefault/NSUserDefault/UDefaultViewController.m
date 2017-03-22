//
//  ViewController.m
//  NSUserDefault
//
//  Created by Manami Ichikawa on 3/13/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "UDefaultViewController.h"

@interface UDefaultViewController ()

@end

@implementation UDefaultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger: 12345  forKey:@"INTEGER"];
    [defaults setDouble : 123.45 forKey:@"DOUBLE"];
}

-(void)viewWillAppear:(BOOL)animated{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.stringTx.text = [defaults stringForKey:@"Key"];
    
    
    
    NSInteger integer = [defaults integerForKey:@"INTEGER"];
    NSLog( @"%ld", integer );
    
    double test       = [defaults doubleForKey :@"DOUBLE"];
    NSLog( @"%f", test );

}
-(void)hideKeyboard{
    //[self.tx resignFirstResponder];
}
    
    



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//
//- (IBAction)setData1:(id)sender {
//    
//    NSString *string = self.tx.text;
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setObject:string forKey:@"Key"];
//    
//    
//    NSUserDefaults *defaul = [NSUserDefaults standardUserDefaults];
//   NSString *str = [defaul stringForKey:@"Key"];
//    self.Lb.text = str;
//    
//}

//- (IBAction)setData2:(id)sender {
//    
//    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//    int i = [ud integerForKey:@"KEY_I"];
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setObject:i forKey:@"Key_I"];
//}
//
//- (IBAction)setData3:(id)sender {
//}

- (IBAction)changeDouble:(id)sender {
    
    self.doubleLabel.text = self.doubleTx.text;
    

}

- (IBAction)changeInt:(id)sender {
    
//    self.intLabel.text = self.intTx.text;
//    
//    NSUserDefaults *defaul2 = [NSUserDefaults standardUserDefaults];
//    NSInteger inte = [defaul2 integerForKey:@"Key2"];
//    self.intTx.text = inte;
}

- (IBAction)changeString:(id)sender {
    
    self.stringLabel.text = self.stringTx.text;
    
//            NSString *string = self.stringTx.text;
//            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//            [defaults setObject:string forKey:@"Key"];
    
    
            NSUserDefaults *defaul = [NSUserDefaults standardUserDefaults];
           NSString *str = [defaul stringForKey:@"Key"];
            self.stringTx.text = str;

   
}
@end
