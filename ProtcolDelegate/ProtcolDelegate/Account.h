//
//  Account.h
//  ProtcolDelegate
//
//  Created by Manami Ichikawa on 3/5/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#ifndef Account_h
#define Account_h
#import  <Foundation/Foundation.h>

#endif /* Account_h */

//FavoriteProgrammingLanguageにやることをお願い　メモ
@protocol FavoriteProgrammingLanguageDelegate <NSObject>


@optional

//FavoriteProgrammingLanguageクラスにやってもらう
- (void)canObjc: (NSString *)string;

@end

@interface Account : NSObject




@property (weak, nonatomic) id<FavoriteProgrammingLanguageDelegate> delegate;

- (void)joinIntern;

@end
