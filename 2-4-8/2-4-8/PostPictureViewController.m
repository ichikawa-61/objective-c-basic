//
//  PostPictureViewController.m
//  2-4-8
//
//  Created by Manami Ichikawa on 4/2/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "PostPictureViewController.h"

@interface PostPictureViewController ()
- (void)closeView;

@end

@implementation PostPictureViewController

static NSString *const _schemeUrl  = @"instagram://app";
static NSString *const _targetType = @"com.instagram.exclusivegram";
static NSString *const _filePath   = @"image.igo";

+ (BOOL)canInstagramOpen{
    NSURL *instagramURL = [NSURL URLWithString:_schemeUrl];
    if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) {
        return YES;
    }
    return NO;
}

- (void)openInstagram {
    
    UIImage *image = [UIImage imageNamed: @"dog"];
    NSData *imageData = UIImagePNGRepresentation(image);
    

    //NSString *DocumentsDirPath = [paths objectAtIndex:0];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *DocumentsDirPath = [paths objectAtIndex:0];
    
    
    // まずは、新規で作るディレクトリの絶対パスを作成します。
    NSString *newDocumentsDirPath= [DocumentsDirPath stringByAppendingPathComponent:@"sampleDirectory"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    
    
   //pathに同一の名前が存在するかチェック。
    if(![self fileExistsAtPath:newDocumentsDirPath]){
        
        //pathこの場合newDocumentsDirPathに、ディレクトリを作る
        BOOL created = [fileManager createDirectoryAtPath: newDocumentsDirPath withIntermediateDirectories:YES attributes:nil error:&error];
        
        if(!created){
            
            NSLog(@"作れなかったよ");
        }
    
    }
    
    NSString *filePath =  [newDocumentsDirPath stringByAppendingPathComponent:_filePath];
    [imageData writeToFile:filePath atomically:YES];
    
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    
    
    self.interactionController = [UIDocumentInteractionController interactionControllerWithURL:fileURL];
    self.interactionController.UTI = _targetType;
    self.interactionController.delegate = self;
    
    BOOL present = [self.interactionController presentOpenInMenuFromRect:self.view.frame
                                                                  inView:self.view
                                                                animated:YES];
    
    
    if (!present) {
        [self closeView];
    }
}


- (BOOL)fileExistsAtPath:(NSString*)path
{
    NSFileManager* fileManager = [[NSFileManager alloc] init];
    /* ファイルが存在するか */
    if ([fileManager fileExistsAtPath:path]) {
        return YES;
    } else {
        return NO;
    }
}




- (void)viewDidAppear:(BOOL)animated
{
    [self openInstagram];
}

- (void)closeView
{
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    self.interactionController.delegate = nil;
}



#pragma mark - UIDocumentInteractionControllerDelegate

- (void)documentInteractionController:(UIDocumentInteractionController *)controller
        willBeginSendingToApplication:(NSString *)application
{
    
}

- (void)documentInteractionController:(UIDocumentInteractionController *)controller
           didEndSendingToApplication:(NSString *)application
{
    [self closeView];
}

- (void) documentInteractionControllerDidDismissOpenInMenu: (UIDocumentInteractionController *) controller
{
    // キャンセルで閉じたとき
    [self closeView];
}
@end
