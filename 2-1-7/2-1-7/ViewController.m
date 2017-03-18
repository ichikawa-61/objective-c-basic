//
//  ViewController.m
//  2-1-7
//
//  Created by Manami Ichikawa on 3/16/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - UITextFieldDelegate

//入力が始まった時にtextfieldがこのメソッドを呼ぶ
// YESを返した場合は編集が可能に
// NO を返した場合は編集が不可能になる
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}


//storyboardのGesturerecognizerで紐付け
- (IBAction)finishEditing:(id)sender {
    
    //text field がfirst reponderでなくなる
    [self.view endEditing:YES];
}


//textfieldがtextfieldが編集されている間呼ぶメソッド
//validateに使う
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:
(NSRange)range replacementString: (NSString *)string
{
    int MAX_LENGTH = 30;
    BOOL rtnValue;
    
    //テキストフィールドの文字数がMAX_LENGTH以下であるか
    if(range.location + range.length + [string length]  <= MAX_LENGTH) {
        rtnValue = YES;
    }
    
    return rtnValue;
}


//returnボタンが押された時にtextfieldが呼ぶメソッド
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([textField.text length] > 0){
        
        //L40と同様
        [self.view endEditing:YES];
        return YES;
    }else{
       // NSLog(@"empty");
        return NO;
    
    }
}

@end
