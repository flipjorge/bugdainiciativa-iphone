//
//  OMCoreDataStack+GAU.m
//  GAU
//
//  Created by Filipe Jorge on 12/02/08.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FJCoreDataStack+Bug.h"
#import "Evento+Extended.h"

@implementation FJCoreDataStack (Bug)

-(void)populateDatabase
{
    //verifica se ficheiro sql já existe
    //se não existir cria e popula a base de dados
    if( ![[NSFileManager defaultManager] fileExistsAtPath:[[FJCoreDataStack shared] storePath]] ){
        
        [Evento generateEventoWithTitle:@"Evento 1" content:@"Content 1" link:@"http://www.bugdainiciativa.com" id:@"1" imageLink:@"http://bugdainiciativa.com/wp-content/themes/diarise/functions/510x200xthumb.php,qsrc=wp-content,_uploads,_2012,_04,_2012-04-27_1625.png,aw=510,ah=200,azc=1,aq=90.pagespeed.ic.jpV6Q6JMRI.png" location:@"Lisboa" startDate:[NSDate date] endDate:[NSDate dateWithTimeIntervalSinceNow:60*60*2]];
        
        [Evento generateEventoWithTitle:@"Evento 2" content:@"Content 2" link:@"http://www.bugdainiciativa.com" id:@"2" imageLink:@"http://bugdainiciativa.com/wp-content/themes/diarise/functions/510x200xthumb.php,qsrc=wp-content,_uploads,_2012,_04,_2012-04-27_1625.png,aw=510,ah=200,azc=1,aq=90.pagespeed.ic.jpV6Q6JMRI.png" location:@"Porto" startDate:[NSDate date] endDate:[NSDate dateWithTimeIntervalSinceNow:60*60*3]];
        
        [[[FJCoreDataStack shared] managedObjectContext] save:nil];
        
    }
    
}

@end
