//
//  OMCoreDataStack+GAU.m
//
//  Created by Filipe Jorge on 12/02/08.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FJDirectory.h"

@implementation FJDirectory

#pragma mark public methods

+(NSString*)documents
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    return path;
}

+(NSString*)temp
{
    return NSTemporaryDirectory();
}

+(NSString*)library
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];    
    return path;
}

+(NSString*)bundle
{
    return [[NSBundle mainBundle] bundlePath];
}

+(NSString*)cache
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];    
    return path;
}

+(NSString*)preferences
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];    
    return path;
}



@end
