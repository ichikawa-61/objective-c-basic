//
//  CustomCell.h
//  2-4-1
//
//  Created by Manami Ichikawa on 3/21/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherCustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;
@property (weak, nonatomic) IBOutlet UILabel *imfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
