//
//  ViewController.m
//  2-4-1
//
//  Created by Manami Ichikawa on 3/15/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "ViewController.h"
#import "Weather.h"
#import "WeatherService.h"
#import "ManageData.h"
#import "WeatherCustomCell.h"
#import "TableDataProvider.h"


@interface ViewController ()
@property (nonatomic,retain) WeatherService *info;
@property(nonatomic, strong) NSArray* list;
@property(strong, nonatomic) TableDataProvider *dataSource;


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
    
    ManageData *data = [[ManageData alloc]init];
    
    NSArray *lists = [data weatherList];
    self.list = lists;
    
    
    //tableView datasourceクラスのインスタンスをデータソースに指定
    self.dataSource = [[TableDataProvider alloc]init];
    self.tableView.dataSource = self.dataSource;
    //[self.dataSource setUpTableView:lists];
    
    //datasourceにデーターを引数で渡したら、tableviewをリロード
    [self.tableView reloadData];

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
                                   NSLog(@"%@:%@の天気は%@です。",weather.city,weather.dateLabel,weather.telop);
                                   
                               }
         ];
    UIAlertAction * tomorrowAction =
        [UIAlertAction actionWithTitle:@"明日の天気"
                                 style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action){
                                   Weather * weather =[self.list objectAtIndex:1];
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
