//
//  FJSplashSceneViewController.m
//  bugdainiciativa-iphone
//
//  Created by Filipe Jorge on 10/21/12.
//  Copyright (c) 2012 dJomba. All rights reserved.
//

#import "FJSplashSceneViewController.h"

@interface FJSplashSceneViewController ()

-(void)performSegue;

@end

@implementation FJSplashSceneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self performSelector:@selector(performSegue) withObject:nil afterDelay:4];
}

-(void)performSegue
{
    [self performSegueWithIdentifier:@"splashToEventos" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
