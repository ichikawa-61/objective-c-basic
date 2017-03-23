//
//  ItemRow.h
//  UITableView2
//
//  Created by Manami Ichikawa on 3/17/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemRow : NSObject

@property(nonatomic)  NSDictionary *sectionList;
@property(nonatomic,strong)  NSString *words;
@property(nonatomic,strong)  NSString *picture;
@property (nonatomic, strong) NSMutableArray *list;

-(id)init:(NSDictionary*)literature;

@end
