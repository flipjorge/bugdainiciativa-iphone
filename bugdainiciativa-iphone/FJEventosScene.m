//
//  FJEventosScene.m
//  bugdainiciativa-iphone
//
//  Created by Filipe Jorge on 5/13/12.
//  Copyright (c) 2012 dJomba. All rights reserved.
//

#import "FJEventosScene.h"
#import "FJEventoDetailSceneScene.h"
#import "FJEventosServices.h"
#import "Evento+Extended.h"
#import "FJEventoCell.h"

@interface FJEventosScene ()

-(void)refresh;
-(void)refreshed;

@end

@implementation FJEventosScene

@synthesize eventos = _eventos;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.eventos = [Evento nextEvents];
    
    self.title = @"Eventos";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshed) name:kEventosSynced object:[FJEventosServices sharedEventosServices]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.eventos = nil;
    
    [[NSNotificationCenter defaultCenter] removeObserver:[FJEventosServices sharedEventosServices]];
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
    FJEventoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Evento *evento = [self.eventos objectAtIndex:indexPath.row];
    
    cell.evento = evento;
    
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

#pragma mark - Refresh

-(void)refresh
{
    [[FJEventosServices sharedEventosServices] sync];
}

-(void)refreshed
{
    self.eventos = [Evento nextEvents];
    
    [self.tableView reloadData];
}

@end
