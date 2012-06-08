//
//  FJBUGAtomParserProtocol.h
//  bugdainiciativa-iphone
//
//  Created by Filipe Jorge on 5/13/12.
//  Copyright (c) 2012 dJomba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FJBUGAtomParser.h"

@protocol FJBUGAtomParserProtocol <NSObject>

-(void)bugAtomParser:(FJBUGAtomParser*)atomParser didParsedEventos:(NSArray*)eventos;

@end
