//
//  ContentViewController.h
//  UIPageViewController
//
//  Created by Manami Ichikawa on 3/10/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentViewController : UIViewController

//labelのためのプロパティ
@property NSInteger pageIndex;
@property (nonatomic,copy)NSString *title;

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;


@end




