//
//  FJEventoDetailSceneViewController.h
//  bugdainiciativa-iphone
//
//  Created by Filipe Jorge on 5/13/12.
//  Copyright (c) 2012 dJomba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Evento.h"

@interface FJEventoDetailSceneScene : UIViewController <UIWebViewDelegate>

@property(nonatomic, strong) Evento *evento;

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *tituloLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scroller;
@property (weak, nonatomic) IBOutlet UIWebView *contentWebView;

@end
