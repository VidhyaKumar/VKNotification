//
//  VKNotification.m
//  Demo Application
//
//  Created by Vidhya Kumar on 20/02/2014.
//  Copyright (c) 2014 CodePulse Inc. All rights reserved.
//

#import "VKNotification.h"

@implementation VKNotification

+ (void)createMessage:(NSString *)msg targetView:(UIView *)sender {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    banner = [[UIView alloc] initWithFrame:CGRectMake(0, -30, screenRect.size.width, 30)];
    banner.backgroundColor = [UIColor blackColor];
    banner.tag = 99;
    banner.contentMode = UIViewContentModeCenter;
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, banner.frame.size.width, banner.frame.size.height)];
    lbl.text = msg;
    lbl.textColor = [UIColor whiteColor];
    lbl.font = [UIFont systemFontOfSize:10];
    lbl.textAlignment = NSTextAlignmentCenter;
    [banner addSubview:lbl];
    
    if (![sender.subviews containsObject:[sender viewWithTag:99]]) {
        [sender addSubview:banner];
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
        [UIView beginAnimations:nil context:nil];
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            banner.frame = CGRectMake(0, 0, screenRect.size.width, 30);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 delay:5.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                banner.frame = CGRectMake(0, -30, screenRect.size.width, 30);
            } completion:^(BOOL finished) {
                [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
                [[[[UIApplication sharedApplication] keyWindow] viewWithTag:99] removeFromSuperview];
                [[sender viewWithTag:99] removeFromSuperview];
            }];
        }];
        [UIView commitAnimations];
    }
}

@end
