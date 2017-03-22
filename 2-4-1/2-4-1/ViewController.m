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
#import <AFNetworking/AFNetworking.h>
@interface ViewController ()

@property(nonatomic, strong) NSMutableArray* weatherDatas;
@end



@implementation ViewController
@synthesize weatherDatas;
static NSString* const _url = @"http://weather.livedoor.com/forecast/webservice/json/v1?city=130010";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    NSMutableArray *weatherData = [[NSMutableArray alloc] initWithCapacity:0];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:_url
      parameters:nil
         success:^(NSURLSessionDataTask *task, id responseObject) {
             // 通信に成功した場合の処理
            
             
                          //　<キーの型*,値の型*>
             for (NSDictionary<NSString *, NSString *> *forecasts in responseObject[@"forecasts"]) {
                 Weather *weather = [[Weather alloc] init];
                 
                 weather.dateLabel = forecasts[@"dateLabel"];
                 weather.telop = forecasts[@"telop"];
                 weather.imageUrl = [forecasts valueForKeyPath:@"image.url"];
                 [weatherData addObject:weather];
                 
             }
             
             
             self.discription = responseObject[@"description"][@"text"];
             
             self.city =responseObject[@"title"];
             
             self.weatherDatas = weatherData;
             
             
 //----------------------------------------------------------------------
 //   テーブルのメソッド内でプロパティの参照ができないと思ったら、呼び出しのタイミングの問題だった
 //   ！！！！！メモに残す！！！！！！
 // --------------------------------------------------------------------
             [self.tableView reloadData];
             
         } failure:^(NSURLSessionDataTask *task, NSError *error) {
             // エラーの場合はエラーの内容をコンソールに出力する
               NSLog(@"%@", error);
         }];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.weatherDatas.count;
    
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"weatherCell";
    CustomCell *cell = (CustomCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
            Weather * weather =[self.weatherDatas objectAtIndex:indexPath.row];
    
            cell.imfoLabel.text = weather.telop;
            cell.dateLabel.text = weather.dateLabel;
            //cell.imageIcon.image = weather.imageUrl;
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
    footerLb.adjustsFontSizeToFitWidth = YES;
    footerLb.text = self.discription;
   
    return footerLb;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 330.0;
}


//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    
//    return self.discription;
//    
//    
//}





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
                                   
                                   //NSLog(@"%@",weather.telop);
                                   Weather * weather =[self.weatherDatas objectAtIndex:0];
                                   NSLog(@"%@:%@の天気は%@です。",self.city,weather.dateLabel,weather.telop);
                                   
                               }
         ];
    UIAlertAction * tomorrowAction =
        [UIAlertAction actionWithTitle:@"明日の天気"
                                 style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action){
                                   //処理を書く
                                   Weather * weather =[self.weatherDatas objectAtIndex:1];
                                    NSLog(@"%@:%@の天気は%@です。",self.city,weather.dateLabel,weather.telop);
                               }
         ];
    
    UIAlertAction *dayAfterTomorrow =
        [UIAlertAction actionWithTitle:@"明後日の天気"
                                 style:(UIAlertActionStyleDefault)
                               handler:^(UIAlertAction * action){
                                  
                                   Weather * weather =[self.weatherDatas objectAtIndex:2];
                                   NSLog(@"%@:%@の天気は%@です。",self.city,weather.dateLabel,weather.telop);
                                  
                               
                               }
         ];
    
    [al addAction:todayAction];
    [al addAction:tomorrowAction];
    [al addAction:dayAfterTomorrow];
    
    [self presentViewController:al animated:YES completion:nil];
}
@end
