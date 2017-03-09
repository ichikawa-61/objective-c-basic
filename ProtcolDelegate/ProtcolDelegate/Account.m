//
//  Account.m
//  ProtcolDelegate
//
//  Created by Manami Ichikawa on 3/5/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"
@interface Account ()

@property (strong, nonatomic) NSString *today;

@end

@implementation Account


//このクラスのプロパティを引数として他のクラス（この場合FavoriteProgrammingLanguage）クラスにあるcanObjc関数を呼ぶためのメソッド
- (void)joinIntern
{
    
     //respondsToSelectorで,delegateオブジェクトがdelegateメソッドを実装しているか判定。実装していたらそのdelegateメソッド実行して！
    
    if ([self.delegate respondsToSelector:@selector(canObjc:)]) {
        
        
        self.today=@"今日";
        [self.delegate canObjc:self.today];
    }
}
@end
