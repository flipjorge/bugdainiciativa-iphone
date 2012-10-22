//
//  FJSplashSegue.m
//  bugdainiciativa-iphone
//
//  Created by Filipe Jorge on 10/21/12.
//  Copyright (c) 2012 dJomba. All rights reserved.
//

#import "FJSplashSegue.h"
#import <QuartzCore/QuartzCore.h>

@interface FJSplashSegue()


@end

@implementation FJSplashSegue

-(void)perform
{
    UIViewController *sourceViewController = (UIViewController*)self.sourceViewController;
    UIViewController *destinationViewController = (UIViewController*)self.destinationViewController;
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    
    
    //desenhar mascara negra
    UIView *darkView = [[UIView alloc] initWithFrame:screenRect];
    darkView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    darkView.alpha = 0;
    [sourceViewController.view addSubview:darkView];
    
    
    [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        sourceViewController.view.frame = CGRectOffset(sourceViewController.view.frame, 0, -200);
        darkView.alpha = .8;
        
    } completion:^(BOOL finished) {
        //
    }];
     
    [sourceViewController.view addSubview:destinationViewController.view];
    
    destinationViewController.view.frame = CGRectMake(0, screenRect.size.height + 200, screenRect.size.width, screenRect.size.height);
    
    [UIView animateWithDuration:.3 delay:.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        
        destinationViewController.view.frame = CGRectMake(0,180,screenRect.size.width,screenRect.size.height);
        
    } completion:^(BOOL finished) {
        
        [destinationViewController.view removeFromSuperview];
        [sourceViewController presentViewController:destinationViewController animated:NO completion:nil];
        
    }];
    
}

@end
