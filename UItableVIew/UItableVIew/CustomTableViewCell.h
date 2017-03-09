//
//  CustomTableViewCell.h
//  UItableVIew
//
//  Created by Manami Ichikawa on 3/8/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *thumnailImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
