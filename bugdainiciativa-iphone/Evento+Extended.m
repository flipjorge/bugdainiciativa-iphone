//
//  Evento+Extended.m
//  bugdainiciativa-iphone
//
//  Created by Filipe Jorge on 5/13/12.
//  Copyright (c) 2012 dJomba. All rights reserved.
//

#import "Evento+Extended.h"
#import "FJCoreDataStack+Bug.h"

@implementation Evento (Extended)

+(Evento *)generateEvento
{
    return [[super class] generateEventoWithTitle:nil content:nil link:nil id:nil imageLink:nil location:nil startDate:nil endDate:nil];
}

+(Evento *)generateEventoWithTitle:(NSString *)sTitle content:(NSString *)sContent link:(NSString *)sLink id:(NSString *)sId imageLink:(NSString *)sImageLink location:(NSString *)sLocation startDate:(NSDate *)sDate endDate:(NSDate *)eDate 
{
    NSManagedObjectContext *context = [[FJCoreDataStack shared] managedObjectContext];

    Evento *evento = [NSEntityDescription insertNewObjectForEntityForName:@"Evento" inManagedObjectContext:context];
    
    evento.title = sTitle;
    evento.content = sContent;
    evento.link = sLink;
    evento.id = sId;
    evento.imageLink = sImageLink;
    evento.location = sLocation;
    evento.startdate = sDate;
    evento.enddate = eDate;
    
    return evento;
}

+(NSArray *)events
{
    NSManagedObjectContext *context = [[FJCoreDataStack shared] managedObjectContext];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Evento"];
    
    return [context executeFetchRequest:fetchRequest error:nil];
}

+(NSArray *)nextEvents
{
    NSManagedObjectContext *context = [[FJCoreDataStack shared] managedObjectContext];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Evento"];
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"startdate" ascending:YES];
    
    fetchRequest.sortDescriptors = [NSArray arrayWithObject:sort];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"startdate >= %@", [NSDate date]];
    
    [fetchRequest setPredicate:predicate];
    
    return [context executeFetchRequest:fetchRequest error:nil];
}

-(void)setImageData:(NSData *)imageData
{
    NSManagedObjectContext *context = [[FJCoreDataStack shared] managedObjectContext];
    
    [self willChangeValueForKey:@"imageData"];
    [self setPrimitiveValue:imageData forKey:@"imageData"];
    [self didChangeValueForKey:@"imageData"];
    
    [context save:nil];
}


@end
