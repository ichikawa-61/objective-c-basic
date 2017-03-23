//
//  ViewController.m
//  UITableView2
//
//  Created by Manami Ichikawa on 3/7/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "ViewController.h"
#import "SectionTableCell.h"
#import "ItemRow.h"
@interface ViewController ()


@end

@implementation ViewController


    
  


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.table.estimatedRowHeight = 78;
    self.table.rowHeight = UITableViewAutomaticDimension;
    
    NSBundle *bundle   = [NSBundle mainBundle];
    
    //読み込むプロパティリストのファイルパスを指定(path, root japはplistの名前と対応させたのでパスは必ず抑える)
    NSString *path     = [bundle pathForResource:@"PropertyList" ofType:@"plist"];
    
    //plistの中身データを取得
    NSDictionary   *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSArray *sea = [NSArray arrayWithArray:dic[@"sea"]];
    NSArray *japan =[NSArray arrayWithArray:dic[@"jap"]];
    
    self.japan = japan;
    self.sea   = sea;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource



//セクションの数を決める
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

//セクションに表示する値を入れる
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection
                      :(NSInteger)section{
    
    NSString *title;
    switch (section) {
        case 0:
            title = @"海外";
            break;
        case 1:
            title = @"日本";
        default:
            break;
    }
    return title;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
       return 3;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SectionTableCell *cell = [tableView dequeueReusableCellWithIdentifier: @"SectionTableCell"forIndexPath:indexPath];
    
    cell.customLabel.numberOfLines = 0;
    
    
    
    NSDictionary*literature2  = [self.japan objectAtIndex:indexPath.row];
    NSDictionary*literature   = [self.sea objectAtIndex:indexPath.row];
   
        switch (indexPath.section){
            case 0:{
                ItemRow *items  = [[ItemRow alloc]init:(NSDictionary *)literature];
                
                cell.customLabel.text  = items.words;
                cell.customImage.image = [UIImage imageNamed:items.picture];
              
            }break;
            case 1:{
                ItemRow *items  = [[ItemRow alloc]init:(NSDictionary *)literature2];
                
                cell.customLabel.text  = items.words;
                cell.customImage.image = [UIImage imageNamed:items.picture];
            
            }break;
           default:
             break;
    }
    
    return cell;
    
    
}

@end
