//
//  Account.m
//  ClassPropertyMethod
//
//  Created by Manami Ichikawa on 3/5/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "account.h"

@interface Account ()

@end

@implementation Account

//introduceメソッドの実装
- (void)introduce;{
    
    NSLog(@"%@%@は、%@が得意な%ld歳です。\n", self.name, self.gender, self.language, self.age);
    
}

@end
