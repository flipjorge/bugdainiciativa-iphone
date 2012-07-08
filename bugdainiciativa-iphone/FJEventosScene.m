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
#import "FJPullRefreshView.h"

@interface FJEventosScene ()

@property(nonatomic, weak) FJPullRefreshView *pullRefreshView;
@property(nonatomic, assign) BOOL refreshing;

-(void)refresh;
-(void)refreshed;

@end

@implementation FJEventosScene

@synthesize eventos = _eventos;
@synthesize pullRefreshView = _pullRefreshView;
@synthesize refreshing = _refreshing;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.eventos = [Evento nextEvents];
    
    self.title = @"Eventos";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshed) name:kEventosSynced object:[FJEventosServices sharedEventosServices]];
    
    //refresh view
    self.pullRefreshView = [[[NSBundle mainBundle] loadNibNamed:@"FJPullRefreshView" owner:self options:nil] lastObject];
    
    self.pullRefreshView.frame = CGRectOffset(self.pullRefreshView.frame, 0, - self.pullRefreshView.frame.size.height);
    
    [self.tableView addSubview:self.pullRefreshView];
    
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
    self.refreshing = YES;
    
    self.tableView.scrollEnabled = NO;
    
    [UIView animateWithDuration:.3 animations:^{
        self.tableView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
    }];
    
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    [self.pullRefreshView showRefreshingMessage];
    
    [[FJEventosServices sharedEventosServices] sync];
}

-(void)refreshed
{
    self.refreshing = NO;
    
    self.eventos = [Evento nextEvents];
    
    [UIView animateWithDuration:.3 animations:^{
        self.tableView.contentInset =  UIEdgeInsetsZero;
    }];
    
    self.navigationItem.rightBarButtonItem.enabled = YES;
    
    self.tableView.scrollEnabled = YES;
    
    [self.pullRefreshView showPullMessage];
    
    [self.tableView reloadData];
}

#pragma mark - Pull to refresh

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if( !self.refreshing ){
        if( scrollView.contentOffset.y < - 99.0f ){
            [self.pullRefreshView showReleaseMessage];
        } else {
            [self.pullRefreshView showPullMessage];
        }
    }
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    if( scrollView.contentOffset.y < - 100.0f ){
        [self refresh];
    }
}

@end