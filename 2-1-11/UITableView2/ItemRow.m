//
//  ItemRow.m
//  UITableView2
//
//  Created by Manami Ichikawa on 3/17/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "ItemRow.h"

@implementation ItemRow
@synthesize list;


-(id)init:(NSDictionary*)literature {
    
    self.words   = literature[@"words"];
    self.picture = literature[@"picture"];
    
    return self;
};

@end
