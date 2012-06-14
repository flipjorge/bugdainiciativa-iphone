//
//  FJEventosServices.h
//  bugdainiciativa-iphone
//
//  Created by Filipe Jorge on 6/14/12.
//  Copyright (c) 2012 dJomba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FJBUGAtomParserProtocol.h"

static NSString *kEventosSynced = @"kEventosSynced";

@interface FJEventosServices : NSObject <FJBUGAtomParserProtocol>

+(FJEventosServices*)sharedEventosServices;

-(void)sync;

@end
