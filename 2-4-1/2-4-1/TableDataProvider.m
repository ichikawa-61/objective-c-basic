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


@implementation WeatherTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setUpTableView:(NSArray*)lists{
    
    UITableView *tableView = [[UITableView alloc]init];
    
    NSLog(@"%@",lists);

   

}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"こここここ");
    return 1;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.item.count;
    
    
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"weatherCell";
    WeatherCustomCell *cell = (WeatherCustomCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //Weather * weather =[self.weatherDatas objectAtIndex:indexPath.row];
    Weather *weather = [self.item objectAtIndex:indexPath.row];
    cell.imfoLabel.text = weather.telop;
    cell.dateLabel.text = weather.dateLabel;
    //cell.imageIcon.image = weather.imageUrl;
    NSURL *url = [NSURL URLWithString:weather.imageUrl];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    cell.imageIcon.image = image;
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 330.0;
}



@end
