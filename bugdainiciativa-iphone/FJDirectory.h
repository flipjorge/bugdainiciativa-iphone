//
//  OMCoreDataStack+GAU.m
//
//  Created by Filipe Jorge on 12/02/08.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FJDirectory : NSObject

+(NSString*)documents;
+(NSString*)temp;
+(NSString*)library;
+(NSString*)bundle;
+(NSString*)cache;
+(NSString*)preferences;

@end
