//
//  FJEventoCell.m
//  bugdainiciativa-iphone
//
//  Created by Filipe Jorge on 6/10/12.
//  Copyright (c) 2012 dJomba. All rights reserved.
//

#import "FJEventoCell.h"

@implementation FJEventoCell

@synthesize image = _image;
@synthesize title = _title;
@synthesize startDate = _startDate;

@synthesize evento = _evento;

-(void)setEvento:(Evento *)evento
{
    _evento = evento;
    
    self.title.text = evento.title;
    
    //start date
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    
    self.startDate.text = [dateFormatter stringFromDate:evento.startdate];
    
    //imagem
    if( evento.imageData ){
        self.image.image = [UIImage imageWithData:evento.imageData];
    } else {
        
        NSOperationQueue *queue = [NSOperationQueue new];
        [queue addOperationWithBlock:^{
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:evento.imageLink] ];
            self.image.image = [UIImage imageWithData:imageData];
            evento.imageData = imageData;
            
            if( !imageData ){
                self.image.image = [UIImage imageNamed:@"bugdefault.png"];
            }
        }];
        
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
