//
//  Account.h
//  ClassPropertyMethod
//
//  Created by Manami Ichikawa on 3/5/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#ifndef Account_h
#define Account_h


#endif /* Account_h */

#import <Foundation/Foundation.h>

@interface Account : NSObject

//アクセッサ
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *gender;
@property (nonatomic) NSString *language;
@property (nonatomic) NSInteger age;


- (void)introduce;

@end
