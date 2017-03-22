//
//  Todo.h
//  DBTest
//
//  Created by Manami Ichikawa on 3/17/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic, assign) NSInteger todoId;
@property (nonatomic, copy) NSString* todoTitle;
@property (nonatomic, copy) NSString* limitDate;
@property (nonatomic, copy) NSString*todoContents;

@end
