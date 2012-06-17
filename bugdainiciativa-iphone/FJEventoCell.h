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

@property(nonatomic, strong) IBOutlet UIImageView *image;
@property(nonatomic, strong) IBOutlet UILabel *title;
@property(nonatomic, strong) IBOutlet UILabel *startDate;

@property(nonatomic, strong) Evento *evento;

@end
