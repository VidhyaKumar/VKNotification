//
//  VKNotification.h
//  Demo Application
//
//  Created by Vidhya Kumar on 20/02/2014.
//  Copyright (c) 2014 CodePulse Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

static UIView *banner;

@interface VKNotification : UIView

+ (void)createMessage:(NSString *)msg targetView:(UIView *)sender;

@end
