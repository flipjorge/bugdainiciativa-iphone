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

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
