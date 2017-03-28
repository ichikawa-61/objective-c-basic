//
//  ViewController.m
//  2-4-1
//
//  Created by Manami Ichikawa on 3/15/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "ViewController.h"
#import "Weather.h"
#import "CustomCell.h"
#import "WeatherService.h"
#import "ManageData.h"


@interface ViewController ()

@property (nonatomic,retain) WeatherService *info;
@property(nonatomic, strong) NSArray* list;
@end



@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.info = [[WeatherService alloc]init];
    self.info.delegate = self;
    [self.info getWeatherInfo];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - APIgetWeatherDelegte method

-(void)finishGettingInfo{
    NSLog(@"ああああああ");
    ManageData *data = [[ManageData alloc]init];
    
    NSArray *lists = [data weatherList];
    self.list = lists;
    
    for(Weather *weather in self.list){
        NSLog(@"%@",weather.telop);

    }

}




#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.list.count;
   
    
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"weatherCell";
    CustomCell *cell = (CustomCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
            //Weather * weather =[self.weatherDatas objectAtIndex:indexPath.row];
            Weather *weather = [self.list objectAtIndex:indexPath.row];
            cell.imfoLabel.text = weather.telop;
            cell.dateLabel.text = weather.dateLabel;
            //cell.imageIcon.image = weather.imageUrl;
            NSURL *url = [NSURL URLWithString:weather.imageUrl];
            NSData *data = [NSData dataWithContentsOfURL:url];
            UIImage *image = [UIImage imageWithData:data];
            cell.imageIcon.image = image;
    
            return cell;

}

//-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    
////    WeatherService * weather = [[WeatherService alloc]init];
////    UILabel* footerLb = [[UILabel alloc]init];
////    footerLb.numberOfLines = 0;
////    footerLb.backgroundColor = [UIColor redColor];
////    footerLb.adjustsFontSizeToFitWidth = YES;
////    //footerLb.text = weather.discription;
////   
////    return footerLb;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 330.0;
}





#pragma mark - UIAlertController
- (IBAction)getWeather:(id)sender {
    
    UIAlertController *al =
        [UIAlertController alertControllerWithTitle:@"天気予報"
                                            message:@"東京の天気"
                                     preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * todayAction =
        [UIAlertAction actionWithTitle:@"今日の天気"
                                 style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action){
                                   
                                   
                                   Weather * weather = [self.list objectAtIndex:0];
                                   //[Weather *weather objectAtIndex:0];
                                   NSLog(@"%@:%@の天気は%@です。",weather.city,weather.dateLabel,weather.telop);
                                   
                               }
         ];
    UIAlertAction * tomorrowAction =
        [UIAlertAction actionWithTitle:@"明日の天気"
                                 style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action){
                                   //処理を書く
                                   Weather * weather =[self.list objectAtIndex:1];
                                   //Weather * weather = [self.weatherDatas objectAtIndex:1];
                                  NSLog(@"%@:%@の天気は%@です。",weather.city,weather.dateLabel,weather.telop);
                              }
         ];
    
    UIAlertAction *dayAfterTomorrow =
        [UIAlertAction actionWithTitle:@"明後日の天気"
                                 style:(UIAlertActionStyleDefault)
                               handler:^(UIAlertAction * action){
                                  
                                   Weather * weather = [self.list objectAtIndex:2];

                                  NSLog(@"%@:%@の天気は%@です。",weather.city,weather.dateLabel,weather.telop);
                                 
                              
                              }
         ];
    
    [al addAction:todayAction];
    [al addAction:tomorrowAction];
    [al addAction:dayAfterTomorrow];
    [self presentViewController:al animated:YES completion:nil];
                              }
@end
