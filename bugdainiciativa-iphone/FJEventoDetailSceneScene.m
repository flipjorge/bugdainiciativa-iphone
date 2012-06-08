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
    [super viewDidUnload];
}

-(void)viewWillAppear:(BOOL)animated
{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    
    self.title = self.evento.title;
    self.dataLabel.text = [dateFormatter stringFromDate:self.evento.startdate];
    self.contentLabel.text = [NSString stringWithoutHTML:self.evento.content];
    
    self.contentLabel.text = [self.contentLabel.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    [self.contentLabel sizeToFit];
    
    self.scroller.contentSize = CGSizeMake(self.scroller.bounds.size.width, self.contentLabel.bounds.size.height + self.contentLabel.frame.origin.y);
    
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.evento.imageLink]];
    
    self.image.image = [UIImage imageWithData:imageData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
