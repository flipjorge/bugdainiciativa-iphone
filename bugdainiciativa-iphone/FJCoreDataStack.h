#import <Foundation/Foundation.h>

@interface FJCoreDataStack : NSObject

@property (readonly, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, copy) NSString *dataModelFilename;
@property (nonatomic, copy) NSString *storePath;
@property (nonatomic, copy) NSString *storeType;

+(FJCoreDataStack*)shared;

-(void)saveContext:(NSManagedObjectContext*)context;


@end
