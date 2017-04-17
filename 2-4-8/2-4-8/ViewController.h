//
//  ViewController.h
//  2-4-8
//
//  Created by Manami Ichikawa on 3/23/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIDocumentInteractionControllerDelegate>
{
    UIDocumentInteractionController *interactionController;
}

@property (nonatomic, retain) UIDocumentInteractionController *interactionController;

@end

