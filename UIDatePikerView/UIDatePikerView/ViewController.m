//
//  ViewController.m
//  UIDatePikerView
//
//  Created by Manami Ichikawa on 3/3/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
   

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.datepicker.datePickerMode = UIDatePickerModeDate;
    [self setTapView];
    [self setTapLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
     
-(void)setTapLabel{
    
    UITapGestureRecognizer *tapLbGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapLabel:)];
    self.label.userInteractionEnabled = YES;
    [self.label addGestureRecognizer:tapLbGesture];
    self.datepicker.hidden = YES;
}

-(void)tapLabel:(UITapGestureRecognizer *)sender{
         
    NSLog(@"ラベルタップ");
         self.datepicker.hidden = NO;
         
         //self.label.text =@"";
         
}

//storyboardでviewcontrollerと関連付け忘れずに！！
-(IBAction)changeDate:(id)sender{
    
    //NSDateFormatterクラスにインスランス生成
    NSDateFormatter *date = [[NSDateFormatter alloc]init];
    //日付のform指定
    date.dateFormat = @"yyyy年MM月dd日";

    self.label.text = [date stringFromDate:self.datepicker.date];
    }

-(void)setTapView {
         
         // シングルタップ
    UITapGestureRecognizer *recognizer =
         
    [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView:)];
         
         // viewのユーザーからのアクションを受け付ける設定
        self.myView.userInteractionEnabled = YES;
         
         // viewにアクションを追加
         
        [self.myView addGestureRecognizer:recognizer];
         
}

- (void)tapView:(UITapGestureRecognizer *)sender{
    
    self.datepicker.hidden = YES;
         
    self.label.text =@"";
         
   // NSLog(@"背景タップ");

}
@end
