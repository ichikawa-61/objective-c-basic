//
//  SecondViewController.h
//  ScreenTransition3
//
//  Created by Manami Ichikawa on 3/12/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Connector.h"
@interface SecondViewController : UIViewController{
    
}

@property (weak, nonatomic) IBOutlet UILabel *Lb;
@property (nonatomic) NSString *word;

- (IBAction)goBack:(id)sender;

@property (nonatomic,strong)Connector *connectorClass;
@end
