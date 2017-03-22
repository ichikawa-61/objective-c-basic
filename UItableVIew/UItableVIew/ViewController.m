//
//  ViewController.m
//  UItableVIew
//
//  Created by Manami Ichikawa on 3/7/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//メモ　storyboard でラベルとイメージを作る。高さ可変になっていない
//画像は行数が増えても場所、大きさ固定

#import "ViewController.h"
#import "TableCellView.h"
#import "CustomTableViewCell.h"

@interface ViewController ()

@property(nonatomic)  NSArray *sentence;
@property(nonatomic)  NSArray *picture;


@end

@implementation ViewController

//@synthesize sentence, picture

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //プロジェクト内のファイルにアクセスできるオブジェクトを宣言
    NSBundle *bundle  = [NSBundle mainBundle];
    
    //読み込むプロパティリストのファイルパスを指定
    NSString *path = [bundle pathForResource:@"Property List" ofType:@"plist"];
 
    //plistの中身データを取得 pathのデータをdicに入れる。
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    
    //plistで作った配列のキーで値を得る
    //dicの中にあるkey sentenceの値をsentenceに入れる
    NSArray *sentence = dic[@"sentence"];
    
    //dicの中にあるkey pictureの値をsentenceに入れる
    NSArray *pict     = dic[@"picture"];
    

    //取得できた配列データをメンバ変数に代入
    
    self.sentence = sentence;
    self.picture  = pict;
    
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;

}


#pragma mark - UITableViewDataSource


//必須　セクションの数を返す
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

//次の２つの関数は必須。行の数と行ごとに記載する内容を決定する

//必須　セレクション内の行の数　配列を書かない時はreturn 6;など(data source プロトコル)

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.picture.count;
    
}


//必須テーブルの行に表示する値を表示(data source プロトコル)

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    
    
    CustomTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell"
                                 
                                                                forIndexPath:indexPath];
    
    //!!重要！！せるの調整でtextLabelやimageViewプロパティを使わない。これらは
    
    //TableCellView（せるカスタマイズするためのクラス）ではなくUITableViewCell（その親クラス）のプロパティ使ったためにセル実装できなかった->コメント l.111
    
    cell.thumnailImageView.image = [UIImage imageNamed:[self.picture objectAtIndex
                                                      :indexPath.row]];
    
    cell.titleLabel.numberOfLines = 0;
    
    cell.titleLabel.text =  [self.sentence objectAtIndex:indexPath.row];
    
    
    return cell;
    
}





- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}









@end



