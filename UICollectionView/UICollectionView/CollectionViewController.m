//
//  ViewController.m
//  UICollectionView
//
//  Created by Manami Ichikawa on 3/8/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
@interface CollectionViewController (){
    
NSArray *photos;
}
@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.sampleCollection setDelegate:self];
    [self.sampleCollection setDataSource:self];
    // Do any additional setup after loading the view, typically from a nib.
    photos = [NSArray arrayWithObjects:@"main-bg.jpg", @"natsume.jpg", @"lincolin.jpg", @"img5.jpg",nil];
    
}


//セクションの数指定
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//セクション内のセルの数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return photos.count;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//セル生成。セルの中に何を入れるか
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    ----------------------------
//    
//    breakpoint cell = nil  イメージビューをつける前は動いた。
//    　imageViewは中身あり
//    ----------------------------
       // static NSString *identifier = @"sampleCell";
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"sampleCell" forIndexPath:indexPath];
    //[cell setBackgroundColor:[UIColor blueColor]];
    
    //UIImage *image = [UIImage imageNamed:@"main-bg.jpg"];
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:2];
    imageView.image = [UIImage imageNamed:[photos objectAtIndex:indexPath.row]];;
    return cell;
}


@end
