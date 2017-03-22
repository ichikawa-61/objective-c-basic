//
//  ViewController.h
//  UIPageViewController
//
//  Created by Manami Ichikawa on 3/10/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentViewController.h"

@interface RootPageViewController : UIViewController<UIPageViewControllerDataSource>

@property (nonatomic,strong) UIPageViewController *PageViewController;

@property (nonatomic,strong)NSArray *titleArray;

- (ContentViewController *)viewControllerAtIndex:(NSUInteger)index;
@end

