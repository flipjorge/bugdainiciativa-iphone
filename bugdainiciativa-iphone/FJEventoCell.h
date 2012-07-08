//
//  FJEventoCell.h
//  bugdainiciativa-iphone
//
//  Created by Filipe Jorge on 6/10/12.
//  Copyright (c) 2012 dJomba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Evento.h"

@interface FJEventoCell : UITableViewCell

@property(nonatomic, weak) IBOutlet UIImageView *image;
@property(nonatomic, weak) IBOutlet UILabel *title;
@property(nonatomic, weak) IBOutlet UILabel *startDate;
@property(nonatomic, weak) IBOutlet UIActivityIndicatorView *activity;

@property(nonatomic, strong) Evento *evento;

@end
