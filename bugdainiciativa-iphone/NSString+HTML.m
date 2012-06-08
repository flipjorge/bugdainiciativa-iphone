//
//  NSString+HTML.m
//  bugdainiciativa-iphone
//
//  Created by Filipe Jorge on 5/27/12.
//  Copyright (c) 2012 dJomba. All rights reserved.
//

#import "NSString+HTML.h"

@implementation NSString (HTML)

+(NSString *)stringWithoutHTML:(NSString *)htmlString
{
    NSScanner *scanner;
    NSString *text = nil;
    
    scanner = [NSScanner scannerWithString:htmlString];
    
    while ([scanner isAtEnd] == NO) {
        
        // find start of tag
        [scanner scanUpToString:@"<" intoString:NULL];
        
        // find end of tag
        [scanner scanUpToString:@">" intoString:&text];
        
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        htmlString = [htmlString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    
    return htmlString;
}

@end
