//
//  FJEventosServices.m
//  bugdainiciativa-iphone
//
//  Created by Filipe Jorge on 6/14/12.
//  Copyright (c) 2012 dJomba. All rights reserved.
//

#import "FJEventosServices.h"
#import "FJBUGAtomParser.h"
#import "Evento+Extended.h"

@interface FJEventosServices()

@property(nonatomic,strong) FJBUGAtomParser *parser;

@end


@implementation FJEventosServices

#pragma mark - Singleton implementation

static FJEventosServices *_sharedEventosServices;

+(FJEventosServices*)sharedEventosServices{
    @synchronized([FJEventosServices class])
    {
        if(!_sharedEventosServices)
            _sharedEventosServices = [[self alloc] init];
        return _sharedEventosServices;
    }
    return nil;
}

+(id)alloc
{
    @synchronized([FJEventosServices class])
    {
        NSAssert(_sharedEventosServices == nil, @"Attempted to allocate a second instance of the FJEventosServices singleton");
        _sharedEventosServices = [super alloc];
        return _sharedEventosServices;
    }
    return nil;
}

#pragma mark sync methods

@synthesize parser = _parser;

-(void)sync
{
    NSOperationQueue *operationQueue = [NSOperationQueue new];
    
    [operationQueue addOperationWithBlock:^{
        
        NSURL *dataURL = [NSURL URLWithString:@"http://bugdainiciativa.com/feed/atom/"];
        
        NSData *data = [NSData dataWithContentsOfURL:dataURL];
        
        self.parser = [[FJBUGAtomParser alloc] initWithData:data andDelegate:self];
        
        [self.parser parse];
        
    }];
    
}

-(void)bugAtomParser:(FJBUGAtomParser *)atomParser didParsedEventos:(NSArray *)eventos
{
    //vais buscar eventos guardados localmente
    NSArray *eventosLocais = [Evento events];
    
    //corre cada eventos vindo do parse (online)
    for (NSMutableDictionary *eventoTemporario in eventos) {
        
        BOOL existe = NO;
        
        //compara evento parsado com todos os eventos guardados localmente
        for (Evento *eventoLocal in eventosLocais) {
            if( [[eventoTemporario objectForKey:@"id"] isEqual:eventoLocal.id] ){
                existe = YES;
                break;
            }
        }
        
        //se eventos ainda não existe, insere na base de dados
        if( !existe ){
            [Evento generateEventoWithTitle:[eventoTemporario objectForKey:@"title"] content:[eventoTemporario objectForKey:@"content"] link:[eventoTemporario objectForKey:@"link"] id:[eventoTemporario objectForKey:@"id"] imageLink:[eventoTemporario objectForKey:@"imageLink"] location:[eventoTemporario objectForKey:@"location"] startDate:[eventoTemporario objectForKey:@"startdate"] endDate:[eventoTemporario objectForKey:@"enddate"]];
        }
    }
    
    self.parser = nil;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kEventosSynced object:_sharedEventosServices];
}

@end
