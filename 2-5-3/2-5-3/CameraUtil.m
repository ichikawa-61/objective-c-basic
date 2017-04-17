//
//  CameraUtil.m
//  2-5-3
//
//  Created by Manami Ichikawa on 4/4/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "CameraUtil.h"

@implementation CameraUtil


-(id)init{
    
    self = [super init];
    self.imageOutput = [[AVCapturePhotoOutput alloc]init];
    
    return self;
}


-(AVCaptureDevice *)findDevice{
    
    AVCaptureDevice * camera = [AVCaptureDevice defaultDeviceWithDeviceType:AVCaptureDeviceTypeBuiltInWideAngleCamera
                                                                  mediaType: AVMediaTypeVideo
                                                                   position:AVCaptureDevicePositionBack];
    
    return camera;

}


-(AVCaptureVideoPreviewLayer *)createView:session Device :(AVCaptureDevice*)device{
    
    
    NSError *error;
    AVCaptureDeviceInput *videoInput = [[AVCaptureDeviceInput alloc]initWithDevice:(AVCaptureDevice *)device error:&error];
    
    
    AVCaptureSession *captureSession = session;
    [captureSession addInput:videoInput];
    [captureSession addOutput:self.imageOutput];
    
    AVCaptureVideoPreviewLayer * layer = [AVCaptureVideoPreviewLayer layerWithSession:(AVCaptureSession *)session];
    
    return layer;
    
}

-(void)takePhoto{
    
    AVCapturePhotoSettings *settings = [[AVCapturePhotoSettings alloc]init];
    [self.imageOutput capturePhotoWithSettings:(AVCapturePhotoSettings *)settings delegate:self];
}



#pragma mark - AVCapturePhotoCaptureDelegate

-(void)captureOutput:(AVCapturePhotoOutput *)captureOutput didFinishProcessingPhotoSampleBuffer:(CMSampleBufferRef)photoSampleBuffer
                                                                    previewPhotoSampleBuffer:(CMSampleBufferRef)previewPhotoSampleBuffer
    resolvedSettings:(AVCaptureResolvedPhotoSettings *)resolvedSettings bracketSettings:(AVCaptureBracketedStillImageSettings *)bracketSettings error:(NSError *)error{
    
    
    if(error){
        NSLog(@"取れてないよ");
    
    }

    
    NSData *imageData = [AVCapturePhotoOutput JPEGPhotoDataRepresentationForJPEGSampleBuffer:photoSampleBuffer previewPhotoSampleBuffer:nil];
    
    UIImage *photo = [[UIImage alloc]initWithData:imageData];
    
    if ([self.delegate respondsToSelector:@selector(finishTakingPhoto:)]){
        
        [self.delegate finishTakingPhoto:photo];
        
    }

}



@end
