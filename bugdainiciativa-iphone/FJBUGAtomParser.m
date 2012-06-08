//
//  FJBUGAtomParser.m
//  bugdainiciativa-iphone
//
//  Created by Filipe Jorge on 5/13/12.
//  Copyright (c) 2012 dJomba. All rights reserved.
//

#import "FJBUGAtomParser.h"
#import "FJBUGAtomParserProtocol.h"
#import "Evento+Extended.h"

@interface FJBUGAtomParser()
{
    BOOL isEntries;
    
    NSString *currentElement;
    NSMutableString *currentString;
}

@property(nonatomic, weak) id<FJBUGAtomParserProtocol> delegate;
@property(nonatomic, strong) NSXMLParser *xmlParser;
@property(nonatomic, copy) NSURL *url;

@property(nonatomic, strong) NSMutableArray *eventos;
@property(nonatomic, strong) Evento *currentEvento;

@end


@implementation FJBUGAtomParser

@synthesize delegate = _delegate;
@synthesize xmlParser = _xmlParser;
@synthesize url = _url;
@synthesize eventos = _eventos;
@synthesize currentEvento = _currentEvento;

-(id)initWithURL:(NSURL*)url andDelegate:(id)delegate
{
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.url = url;
    }
    return self;
}

-(void)parse
{
    self.xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:self.url];
    self.xmlParser.delegate = self;
    [self.xmlParser parse];
}

-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    self.eventos = [NSMutableArray new];
}

-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    [self.delegate bugAtomParser:self didParsedEventos:self.eventos];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    currentString = [NSMutableString new];
    
    if( [elementName isEqualToString:@"entry"] ){
        isEntries = YES;
        
        Evento *evento = [Evento generateEvento];
        self.currentEvento = evento;
        [self.eventos addObject:evento];
        
    }
    
    if( [elementName isEqualToString:@"title"] && isEntries ){
        currentElement = @"title";
    } else if( [elementName isEqualToString:@"content"] && isEntries ){
        currentElement = @"content";
    } else if( [elementName isEqualToString:@"event_start_date"] && isEntries ){
        currentElement = @"event_start_date";
    } else if( [elementName isEqualToString:@"event_end_date"] && isEntries ){
        currentElement = @"event_end_date";
    } else if( [elementName isEqualToString:@"thumbnail"] && isEntries ){
        currentElement = @"thumbnail";
    }
    
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [currentString appendString:string];
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSDateFormatter *dateFormatter;
    
    if( [elementName isEqualToString:@"title"] && isEntries ){
        self.currentEvento.title = currentString;
    } else if( [elementName isEqualToString:@"content"] && isEntries ){
        self.currentEvento.content = currentString;
    } else if( [elementName isEqualToString:@"event_start_date"] && isEntries ){
        
        dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
        
        self.currentEvento.startdate = [dateFormatter dateFromString:currentString];
        
    } else if( [elementName isEqualToString:@"event_end_date"] && isEntries ){
        
        dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
        
        self.currentEvento.enddate = [dateFormatter dateFromString:currentString];
        
    } else if( [elementName isEqualToString:@"thumbnail"] && isEntries ){
        self.currentEvento.imageLink = currentString;
    }
    
    currentElement = nil;
    currentString = nil;
}

@end
