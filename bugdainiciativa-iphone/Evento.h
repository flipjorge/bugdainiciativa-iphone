//
//  Evento.h
//  bugdainiciativa-iphone
//
//  Created by Filipe Jorge on 5/13/12.
//  Copyright (c) 2012 dJomba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Category;

@interface Evento : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSDate * enddate;
@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSData * imageData;
@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSDate * startdate;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * imageLink;
@property (nonatomic, retain) NSSet *categories;
@end

@interface Evento (CoreDataGeneratedAccessors)

- (void)addCategoriesObject:(Category *)value;
- (void)removeCategoriesObject:(Category *)value;
- (void)addCategories:(NSSet *)values;
- (void)removeCategories:(NSSet *)values;

@end
