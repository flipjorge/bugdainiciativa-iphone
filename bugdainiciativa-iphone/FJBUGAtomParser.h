//
//  FJBUGAtomParser.h
//  bugdainiciativa-iphone
//
//  Created by Filipe Jorge on 5/13/12.
//  Copyright (c) 2012 dJomba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FJBUGAtomParser : NSObject <NSXMLParserDelegate>

-(id)initWithURL:(NSURL*)url andDelegate:(id)delegate;
-(void)parse;

@end
