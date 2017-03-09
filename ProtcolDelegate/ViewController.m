//
//  ViewController.m
//  ProtcolDelegate
//
//  Created by Manami Ichikawa on 3/5/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "ViewController.h"
//頼まれる側はinport必要
#import "Account.h"

@interface ViewController()<HogeDelegate>//頼まれたよ。
@property (strong, nonatomic) Hoge *hoge;

@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.hoge = [Hoge new];
    // hogeのdelegateに自身を指定します。
    self.hoge.delegate = self;
    [self.hoge fuga];
}



/**
 delegationの通知を受けとったら実行する処理
 delegateメソッドの具体的な実装を記述します。
 
 @param string Hogeクラス側から渡されてくる文字列
 */

- (void)didFuga:(NSString *)string
{
    // Hogeクラス側から渡されてくる文字列をラベルに表示します。
    NSLog(@"やっといたよ");
}

@end
