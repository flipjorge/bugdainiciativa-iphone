//
//  FJEventoDetailSceneViewController.m
//  bugdainiciativa-iphone
//
//  Created by Filipe Jorge on 5/13/12.
//  Copyright (c) 2012 dJomba. All rights reserved.
//

#import "FJEventoDetailSceneScene.h"
#import "NSString+HTML.h"

@interface FJEventoDetailSceneScene ()

@end

@implementation FJEventoDetailSceneScene

@synthesize evento = _evento;
@synthesize image = _image;
@synthesize scroller = _scroller;
@synthesize dataLabel = _dataLabel;
@synthesize contentLabel = _contentLabel;
@synthesize contentWebView = _contentWebView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)viewDidUnload
{
    self.evento = nil;
    [self setDataLabel:nil];
    [self setContentLabel:nil];
    [self setScroller:nil];
    [self setImage:nil];
    self.contentWebView = nil;
    [super viewDidUnload];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.contentWebView.delegate = self;
    [self.contentWebView loadHTMLString:self.evento.content baseURL:nil];
    self.contentWebView.scrollView.bounces = NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Web view delegate
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.contentWebView sizeToFit];
    
    self.scroller.contentSize = CGSizeMake(self.scroller.bounds.size.width, self.contentWebView.bounds.size.height + self.contentWebView.frame.origin.y);
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if( navigationType == UIWebViewNavigationTypeOther ){
        return YES;
    }
    
    [[UIApplication sharedApplication] openURL:request.URL];
    
    return NO;
}

@end
