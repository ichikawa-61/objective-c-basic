//
//  ViewController.m
//  UIPageViewController
//
//  Created by Manami Ichikawa on 3/10/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "PageViewController.h"

@interface RootPageViewController ()

@end

@implementation RootPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.titleArray = @[@"1ページ目",@"2ページ目",@"3ぺージ目"];
    //ストーリ
    self.PageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.PageViewController.dataSource = self;
    
    ContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.PageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    
    
    [self addChildViewController:self.PageViewController];
    [self.view addSubview:self.PageViewController.view];
    [self.PageViewController didMoveToParentViewController:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}


//右スワイプで呼ばれる

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{

//！ストーリボード確認
    NSUInteger index =((ContentViewController*) viewController).pageIndex;
    if ((index == 0) || (index == NSNotFound))
    {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
    
}

//左スワイプで呼べれる
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{

    
    NSUInteger index = ((ContentViewController*) viewController).pageIndex;
    if (index == NSNotFound)
    {
        return nil;
    }
    index++;
    if (index == [self.titleArray count])
    {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}


- (ContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.titleArray count] == 0) || (index >= [self.titleArray count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    ContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentViewController"];
    
    pageContentViewController.title = self.titleArray[index];
    pageContentViewController.pageIndex = index;
    return pageContentViewController;
}

#pragma mark - No of Pages Methods
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.titleArray count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


@end
