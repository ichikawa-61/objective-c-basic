//
//  WeatherTableView.m
//  2-4-1
//
//  Created by Manami Ichikawa on 3/28/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "TableDataProvider.h"
#import "WeatherCustomCell.h"
#import "Weather.h"


@implementation TableDataProvider

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setUpTableView:(NSArray*)lists{
    
      self.items = lists;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.items.count;
    
}




-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"weatherCell";
    WeatherCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Weather *weather = [self.items objectAtIndex:indexPath.row];
    
//    NSString *weatherInfomation = weather.telop;
//    NSString *weatherDate       = weather.dateLabel;
    
    cell.imfoLabel.text = [NSString stringWithFormat:@"%@の天気は%@です", weather.dateLabel, weather.telop];
    //cell.dateLabel.text = weather.dateLabel;
    NSURL *url = [NSURL URLWithString:weather.imageUrl];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    cell.imageIcon.image = image;
    
    return cell;
    
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UILabel* footerLb = [[UILabel alloc]init];
    footerLb.numberOfLines = 0;
    footerLb.backgroundColor = [UIColor redColor];
    return footerLb;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return tableView.sectionHeaderHeight;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 330.0;
//}



@end
