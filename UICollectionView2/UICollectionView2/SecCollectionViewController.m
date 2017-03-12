//
//  ViewController.m
//  UICollectionView2
//
//  Created by Manami Ichikawa on 3/9/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "SecCollectionViewController.h"

@interface ViewController (){
    NSArray *Photos;
    NSArray *Photos2;
    NSArray *sections;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.secCollectionView setDataSource:self];
    [self.secCollectionView setDelegate:self];
    Photos = [NSArray arrayWithObjects:@"main-bg.jpg", @"pict1.jpg", @"pict2.jpg",nil];
    Photos2 = [NSArray arrayWithObjects:@"img1.jpg", @"img4.jpg", @"img5.jpg", @"KvjW03.jpg",nil];
    sections = @[@"セクション１",@"セクション２"];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    //セクションの数
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(section==0){//セクション0
        return Photos.count;
    }else{
        return Photos2.count;
    }
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

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell;
    if(indexPath.section==0){
        
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
        //cell.backgroundColor = [UIColor greenColor];
        UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
        
        imageView.image = [UIImage imageNamed:[Photos objectAtIndex:indexPath.row]];;

    }else if(indexPath.section==1){//セクション1のセル
        
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
        //cell.backgroundColor = [UIColor blueColor];
        UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
        
        imageView.image = [UIImage imageNamed:[Photos2 objectAtIndex:indexPath.row]];;
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
