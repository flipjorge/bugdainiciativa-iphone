//
//  FJEventosScene.m
//  bugdainiciativa-iphone
//
//  Created by Filipe Jorge on 5/13/12.
//  Copyright (c) 2012 dJomba. All rights reserved.
//

#import "FJEventosScene.h"
#import "FJEventoDetailSceneScene.h"
#import "Evento+Extended.h"
#import "FJBUGAtomParser.h"

@interface FJEventosScene ()

@property(nonatomic,strong) FJBUGAtomParser *eventosParser;

//-(void)reloadImage;

@end

@implementation FJEventosScene

@synthesize eventos = _eventos;
@synthesize eventosParser = _eventosParser;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.eventos = [Evento events];
    
    self.title = @"Eventos";
    
    NSURL *url = [NSURL URLWithString:@"http://bugdainiciativa.com/feed/atom/"];
    
    self.eventosParser = [[FJBUGAtomParser alloc] initWithURL:url andDelegate:self];
    
    [self.eventosParser parse];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.eventos = nil;
    self.eventosParser = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.eventos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"EventoDefault";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Evento *evento = [self.eventos objectAtIndex:indexPath.row];
    
    cell.textLabel.text = evento.title;
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    
    cell.detailTextLabel.text = [dateFormatter stringFromDate:evento.startdate];
    /*
    NSOperationQueue *operationQueue = [NSOperationQueue new];
    [operationQueue addOperationWithBlock:^{
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:evento.imageLink]];
        cell.imageView.image = [UIImage imageWithData:imageData];
    }];
     */
    
    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:evento.imageLink] ]];
    
    return cell;
}

#pragma mark - Table view delegate

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if( [segue.identifier isEqualToString:@"eventosToDetail"] )
    {
        FJEventoDetailSceneScene *eventoDetailScene = segue.destinationViewController;
        
        eventoDetailScene.evento = (Evento*)[self.eventos objectAtIndex:self.tableView.indexPathForSelectedRow.row ];
    }
}

#pragma mark - Parser delegate

-(void)bugAtomParser:(FJBUGAtomParser *)atomParser didParsedEventos:(NSArray *)eventos
{
    self.eventos = eventos;
    
    [self.tableView reloadData];
}

@end
