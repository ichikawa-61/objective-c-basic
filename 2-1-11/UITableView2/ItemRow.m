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


-(id)init:(int)country{
    
   
    
    
//    switch (country) {
//        case 0:{
//            self.list    = [sea objectAtIndex:literature ];
//        
//        }break;
//        case 1:{
//            self.list    = [japan objectAtIndex:literature ];
//            
//        }break;
//        default:
//            break;
//    }
//    
//   
    
    self.words   = self.list[@"words"];
    self.picture = self.list[@"picture"];
    
     
    return self;
};

@end
