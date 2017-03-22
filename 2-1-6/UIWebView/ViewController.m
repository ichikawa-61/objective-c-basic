//
//  ViewController.m
//  UIWebView
//
//  Created by Manami Ichikawa on 3/2/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
static NSString* const _url = @"http://www.apple.com/jp/iphone/";




//-(BOOL) hasInternet{
//    
//
//    }
//    return YES;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // デリゲート
    self.webView.delegate = self;
    
    
    // URLを指定
    NSURL *url = [NSURL URLWithString:_url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
   
    
    // リクエストを投げる
    [self.webView loadRequest:request];
    }



// ロード時にインジケータをまわす
- (void)webViewDidStartLoad:(UIWebView*)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

// ロード完了で非表示
- (void)webViewDidFinishLoad:(UIWebView*)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}



//ビューの読み込みが終わって画面描画アニメーションが始まる前に呼ばれる
- (void)viewDidAppear:(BOOL)animated{
    
    Reachability *reach = [Reachability reachabilityWithHostName:_url];
    NetworkStatus internetStatus = [reach currentReachabilityStatus];
    
    if(internetStatus == NotReachable){
        
       
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"タイトル"
                         message:@"No Connection"
                  preferredStyle:UIAlertControllerStyleAlert];
    
      [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                
                           style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction *action) {
                                                          
                        NSLog(@"@OK");
                        }
     ]];
    
    
    [self presentViewController:alertController animated:YES completion:nil];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-------------------------------------------------
//  urlなどは編集が必要になった時に大変にならないように
//  定数に入れる
//-------------------------------------------------

@end
