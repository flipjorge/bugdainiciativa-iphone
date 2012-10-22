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
@synthesize tituloLabel = _tituloLabel;
@synthesize contentWebView = _contentWebView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)viewDidUnload
{
    self.evento = nil;
    self.tituloLabel = nil;
    [self setScroller:nil];
    [self setImage:nil];
    self.contentWebView = nil;
    [super viewDidUnload];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.image.image = [UIImage imageWithData:self.evento.imageData];
    self.tituloLabel.text = [self.evento.title stringByDecodingHTMLEntities];
    
    CGSize tituloSize = [self.evento.title sizeWithFont:self.tituloLabel.font constrainedToSize:CGSizeMake(280, 9999) lineBreakMode:self.tituloLabel.lineBreakMode];
    
    self.tituloLabel.frame = CGRectMake(self.tituloLabel.frame.origin.x, self.tituloLabel.frame.origin.y, 280, tituloSize.height);
    
    self.contentWebView.delegate = self;
    [self.contentWebView loadHTMLString:self.evento.content baseURL:nil];
    self.contentWebView.scrollView.bounces = NO;
    self.contentWebView.scrollView.scrollEnabled = NO;
    
    self.contentWebView.frame = CGRectMake(self.contentWebView.frame.origin.x, self.tituloLabel.frame.origin.y + tituloSize.height, self.contentWebView.frame.size.width, 500);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Web view delegate
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    CGRect frame = self.contentWebView.frame;
    frame.size.height = 1;
    self.contentWebView.frame = frame;
    CGSize fittingSize = [self.contentWebView sizeThatFits:CGSizeZero];
    frame.size = fittingSize;
    self.contentWebView.frame = frame;
    
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
