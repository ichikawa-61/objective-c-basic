//
//  ViewController.m
//  Objective-C
//
//  Created by Manami Ichikawa on 2/18/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //基礎
    
    NSString *str  = @"ほげ";
    
    BOOL y         = YES;
    BOOL yn        = YES;
    
    NSNumber *num  = [NSNumber numberWithBool:YES];
    NSInteger age = 10;
    NSArray *fruit = @[@"apple",@"banana",@"orange"];
    NSDictionary *city = [NSDictionary dictionaryWithObjectsAndKeys:
                          
                          @"札幌", @"北海道",
                          @"那覇", @"沖縄",
                          @"甲府", @"山梨",
                          @"前橋", @"群馬",
                          @"松江", @"島根",
                          @"高松", @"香川",
                          nil];
    
    NSString *primary = [city objectForKey:@"沖縄"];
    
    NSLog(@"名前は%@", str);
    NSLog(@"which: %d", y);
    NSLog(@"yn: %@",(yn ==1? @"YES": @"NO"));
    NSLog(@"num: %@", num);
    NSLog(@"年齢は%ld歳", age);
    NSLog(@"果物：%@",fruit);
    NSLog(@"県庁所在地は:%@",primary);
    // if文,　else,
    
    NSInteger score1 = 75;
    NSInteger score2 = 45;
    
    if (score1 > 50){
        
        NSLog(@"great");
    }
    
    if (score2 > 50){
        
        NSLog(@"great");
        
    }else{
        NSLog(@"soso...");
    }
    
    if(score1 >= 80){
        
        NSLog(@"great!");
        
    }else if(score1 < 80 && score1 >=50){
        
        NSLog(@"good");
        
    }else{
        
        NSLog(@"soso...");
        
    }
    
    // 三項演算子
    int a = 10;
    int b = 12;
    
    NSString *same = (a==b)? @"同じ" : @ "違う";
    
    NSLog(@"%@",same);
    
    //for文 　高速列挙構文(27行目のNSDictionary参照)
    
    for(int i=1;i<5;i++){
        
        NSLog(@"%d回目のループ",i);
        
    }
    
    for (NSString *key in city) {
        NSLog(@"%@ = %@", key, city[key]);
        
    }
    
    //switch文
    
    int greet = 2;
    switch(greet){
        case 1:
            NSLog(@"おはよう！");
            break;
        case 2:
            NSLog(@"こんにちは！");
            break;
        case 3:
            NSLog(@"こんばんは。");
            break;
            
    }
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



    // Do any additional setup after loading the view, typically from a nib.

@end
