//
//  ViewController.m
//  2-5-3
//
//  Created by Manami Ichikawa on 4/3/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "PhotoCaptureViewController.h"
#import "CameraUtil.h"
@interface PhotoCaptureViewController ()
@property CameraUtil *camera;
@property AVCaptureSession *session;

@end

@implementation PhotoCaptureViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.camera = [[CameraUtil alloc]init];
    self.session = [[AVCaptureSession alloc]init];
    
    [self setUpCameraView];
    
    [self.session startRunning];
    self.camera.delegate = self;
    
}

-(void)setUpCameraView{
    
    AVCaptureDevice *device = [self.camera findDevice];
    
    AVCaptureVideoPreviewLayer *videoLayer = [self.camera createView:self.session Device:device];
    
    if(videoLayer){
    
        videoLayer.frame        = self.cameraView.bounds;
        videoLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        [self.cameraView.layer addSublayer:videoLayer];
    }else{
        NSLog(@"VideoLayerがnil");
    }
   
}


- (IBAction)openCamera:(id)sender {
    [self.camera takePhoto];
}

#pragma mark - GetImageDelegate

-(void)finishTakingPhoto:(UIImage*)picture{
    
    CIImage *filteredImage = [[CIImage alloc]initWithCGImage:(picture.CGImage)];
    CIFilter *filter       = [CIFilter filterWithName:@"CIColorMonochrome"];
    [filter setValue:filteredImage forKey:@"inputImage"];
    
    filteredImage = filter.outputImage;
    CIContext *ciContext = [CIContext contextWithOptions:nil];
    CGImageRef imageRef  = [ciContext createCGImage:filteredImage
                                           fromRect:[filteredImage extent]];
    UIImage *outputImage  = [UIImage imageWithCGImage:imageRef
                                                scale:1.0f
                                          orientation:UIImageOrientationUp];
    CGImageRelease(imageRef);
    
    
    
    [self.imagePhoto setImage:outputImage];



}




@end
