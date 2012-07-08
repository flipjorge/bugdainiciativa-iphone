//
//  FJPullRefreshView.h
//  bugdainiciativa-iphone
//
//  Created by Filipe Jorge on 7/8/12.
//  Copyright (c) 2012 dJomba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FJPullRefreshView : UIView

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

-(void)showReleaseMessage;
-(void)showRefreshingMessage;
-(void)showPullMessage;

@end
