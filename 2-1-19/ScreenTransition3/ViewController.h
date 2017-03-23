//
//  ViewController.h
//  ScreenTransition3
//
//  Created by Manami Ichikawa on 3/12/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Connector.h"

@interface ViewController : UIViewController{

    NSString *wordToPass;
    IBOutlet UITextField *TextField;

    
}

//@property (nonatomic,strong) NSString *stringToPass;


- (IBAction)getText:(id)sender;

@end

