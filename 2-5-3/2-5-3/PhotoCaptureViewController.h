//
//  ViewController.h
//  2-5-3
//
//  Created by Manami Ichikawa on 4/3/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CameraUtil.h"

@interface PhotoCaptureViewController : UIViewController<GotImageDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imagePhoto;


- (IBAction)openCamera:(id)sender;


@property (weak, nonatomic) IBOutlet UIView *cameraView;

-(void)setUpCameraView;
@end

