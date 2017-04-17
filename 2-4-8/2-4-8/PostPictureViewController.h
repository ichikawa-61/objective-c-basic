//
//  PostPictureViewController.h
//  2-4-8
//
//  Created by Manami Ichikawa on 4/2/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostPictureViewController : UIViewController<UIDocumentInteractionControllerDelegate>
{
    UIDocumentInteractionController *interactionCotroller;
}

+ (BOOL)canInstagramOpen;
//- (void)setImage:(UIImage *)image;
- (void)openInstagram;
@property (nonatomic,retain) UIDocumentInteractionController *interactionController;


@end
