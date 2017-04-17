//
//  CameraUtil.h
//  2-5-3
//
//  Created by Manami Ichikawa on 4/4/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@protocol GotImageDelegate<NSObject>

-(void)finishTakingPhoto:(UIImage*)picture;

@end

@interface CameraUtil : NSObject<AVCapturePhotoCaptureDelegate>

-(AVCaptureDevice *)findDevice ;
-(AVCaptureVideoPreviewLayer *)createView:session Device:(AVCaptureDevice*)device;
@property AVCapturePhotoOutput *imageOutput;

@property (weak,nonatomic)id delegate;

@property UIImage *photoImage;
- (id)init;

-(void)takePhoto;
@end
