//
//  Category+Extended.m
//  bugdainiciativa-iphone
//
//  Created by Filipe Jorge on 5/13/12.
//  Copyright (c) 2012 dJomba. All rights reserved.
//

#import "Category+Extended.h"
#import "FJCoreDataStack.h"

@implementation Category (Extended)

+(Category *)generateCategoryWithTitle:(NSString *)sTitle
{
    NSManagedObjectContext *context = [[FJCoreDataStack shared] managedObjectContext];
    
    Category *category = [NSEntityDescription insertNewObjectForEntityForName:@"Category" inManagedObjectContext:context];
    
    category.title = sTitle;
    
    return category;
}

@end
