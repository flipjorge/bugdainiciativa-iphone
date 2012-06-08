//
//  FJEventosScene.h
//  bugdainiciativa-iphone
//
//  Created by Filipe Jorge on 5/13/12.
//  Copyright (c) 2012 dJomba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FJBUGAtomParserProtocol.h"

@interface FJEventosScene : UITableViewController <FJBUGAtomParserProtocol>

@property(nonatomic, strong) NSArray *eventos;

@end