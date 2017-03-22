//
//  ViewController.m
//  UICollectionView2
//
//  Created by Manami Ichikawa on 3/9/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "SecCollectionViewController.h"
#import "CollectionViewCell.h"

@interface ViewController (){
    NSArray *photos;
    NSArray *photos2;
    NSArray *sections;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.secCollectionView setDataSource:self];
    //[self.secCollectionView setDelegate:self];
    photos  = @[@"main-bg.jpg", @"pict1.jpg", @"pict2.jpg"];
    photos2 = @[@"img1.jpg", @"img4.jpg", @"img5.jpg", @"KvjW03.jpg"];
    sections = @[@"セクション１",@"セクション２"];
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    //セクションの数
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(section==0){//セクション0
        return photos.count;
    }else{
        return photos2.count;
    }
}



-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CollectionViewCell *cell;
    if(indexPath.section==0){
        
        
        //Returns a reusable cell object located by its identifier
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
        
        UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
        
        imageView.image = [UIImage imageNamed:[photos objectAtIndex:indexPath.row]];;
        
    }else if(indexPath.section==1){//セクション1のセル
        
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
        
        UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
        imageView.image = [UIImage imageNamed:[photos2 objectAtIndex:indexPath.row]];;
    }
    return cell;
}


- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView
          viewForSupplementaryElementOfKind:(NSString *)kind
                                atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView* reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        // --- ヘッダ
        UICollectionReusableView* headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                        withReuseIdentifier:@"HeaderView"
                        forIndexPath:indexPath];
        
        UILabel *label = [headerView viewWithTag:2];
        label.text = sections[indexPath.section];
//        headerView.backgroundColor = colors[indexPath.section];
        
        reusableview = headerView;
    }
    return reusableview;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
