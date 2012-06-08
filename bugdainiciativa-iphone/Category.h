//
//  Category.h
//  bugdainiciativa-iphone
//
//  Created by Filipe Jorge on 5/13/12.
//  Copyright (c) 2012 dJomba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Category : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *eventos;
@end

@interface Category (CoreDataGeneratedAccessors)

- (void)addEventosObject:(NSManagedObject *)value;
- (void)removeEventosObject:(NSManagedObject *)value;
- (void)addEventos:(NSSet *)values;
- (void)removeEventos:(NSSet *)values;

@end
