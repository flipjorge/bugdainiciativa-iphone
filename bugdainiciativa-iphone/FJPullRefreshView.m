//
//  FJPullRefreshView.m
//  bugdainiciativa-iphone
//
//  Created by Filipe Jorge on 7/8/12.
//  Copyright (c) 2012 dJomba. All rights reserved.
//

#import "FJPullRefreshView.h"

@implementation FJPullRefreshView

@synthesize messageLabel = _messageLabel;

- (id)init
{
    self = [super init];
    if (self) {
        
        self.messageLabel.text = @"Pull down to refresh";
        
    }
    return self;
}

-(void)showReleaseMessage
{
    self.messageLabel.text = @"Release to refresh";
}

-(void)showRefreshingMessage
{
    self.messageLabel.text = @"Refreshing...";
}

-(void)showPullMessage
{
    self.messageLabel.text = @"Pull down to refresh";
}

@end
