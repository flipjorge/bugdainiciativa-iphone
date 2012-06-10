//
//  Evento+Extended.h
//  bugdainiciativa-iphone
//
//  Created by Filipe Jorge on 5/13/12.
//  Copyright (c) 2012 dJomba. All rights reserved.
//

#import "Evento.h"

@interface Evento (Extended)

+(Evento*)generateEvento;

+(Evento*)generateEventoWithTitle:(NSString*)sTitle content:(NSString*)sContent link:(NSString*)sLink id:(NSString*)sId imageLink:(NSString*) sImageLink location:(NSString*)sLocation startDate:(NSDate*)sDate endDate:(NSDate*)eDate;

+(NSArray*)events;
+(NSArray*)nextEvents;

@end
