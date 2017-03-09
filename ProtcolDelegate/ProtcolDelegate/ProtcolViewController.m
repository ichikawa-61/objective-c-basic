//
//  ViewController.m
//  ProtcolDelegate
//
//  Created by Manami Ichikawa on 3/5/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "ProtcolViewController.h"
//頼まれる側はinport必要
#import "Account.h"

@interface FavoriteProgrammingLanguage()<FavoriteProgrammingLanguageDelegate>//頼まれたよ。
@property (strong, nonatomic) Account *intern;

@end

@implementation FavoriteProgrammingLanguage


- (void)viewDidLoad {
    [super viewDidLoad];

    self.intern = [Account new];
    // hogeのdelegateに自身を指定。
    self.intern.delegate = self;
    [self.intern joinIntern];
}


//- (void)viewDidLoad{
//    
//    [super viewDidLoad];
//    
//    self.intern = [Account new];
//    // hogeのdelegateに自身を指定。
//    self.intern.delegate = self;
//    [self.intern joinIntern];
//}




 //delegationの通知を受けとったら実行する処理
 //delegateメソッドの具体的な実装。

- (void)canObjc:(NSString *)string
{
    // Accountクラス側から渡されてくる文字列を表示。
    NSLog(@"%@やっといたよ",string);
}

@end
