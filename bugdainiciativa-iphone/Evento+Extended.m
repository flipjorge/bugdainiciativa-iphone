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

@end
