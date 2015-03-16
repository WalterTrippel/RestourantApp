//
//  MainViewController.m
//  Test
//
//  Created by User on 13/03/2015.
//  Copyright (c) 2015 User. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController
{
    UISearchBar * searchBar;
    NSArray * resultSearch;
    
    NSUInteger arraySize;
}

-(BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    [self filterContentForSearchText:text scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{

    return YES;
}

-(void)filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope
{
    NSPredicate * resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchText];
    _data = [NSMutableArray arrayWithObjects:[[Restaurant alloc] initWithCode:@"1" name:@"KFC"], [[Restaurant alloc] initWithCode:@"2" name:@"McDonalds"], [[Restaurant alloc] initWithCode:@"3" name:@"BurgerKing"], [[Restaurant alloc] initWithCode:@"4" name:@"CurryWurst"], nil];
    resultSearch = [_data filteredArrayUsingPredicate:resultPredicate];
    [_table reloadData];
}

-(void) onClickAll
{
    _specButton.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.98];
    _allButton.backgroundColor = [UIColor colorWithRed:0.0 green:(239 / 255.0) blue:1.0 alpha:1];
}

-(void) onClickSpec
{
    _allButton.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.98];
    _specButton.backgroundColor = [UIColor colorWithRed:0.0 green:(239 / 255.0) blue:1.0 alpha:1];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _table = [[MainTableView alloc] init];
    _table.frame = self.view.bounds;

    //_data = [NSMutableArray arrayWithObjects:[[Restaurant alloc] initWithCode:@"1" name:@"KFC"], [[Restaurant alloc] initWithCode:@"2" name:@"McDonalds"], [[Restaurant alloc] initWithCode:@"3" name:@"BurgerKing"], [[Restaurant alloc] initWithCode:@"4" name:@"CurryWurst"], nil];
    
    [self getAllData];
    
    [self.view addSubview:_table];
    _allButton = [[[AllRestaurantButton alloc] init] autorelease];
    _allButton.frame = CGRectMake(0, self.view.bounds.size.height * 0.75, self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.14);
    [self.view addSubview:_allButton];
    [_allButton addTarget:self action:@selector(onClickAll) forControlEvents:UIControlEventTouchDown];
    
    _specButton = [[[SpecificRestaurantButton alloc] init] autorelease];
    _specButton.frame = CGRectMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.75, self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.14);
    [self.view addSubview:_specButton];
    [_specButton addTarget:self action:@selector(onClickSpec) forControlEvents:UIControlEventTouchDown];
    
    /** fires all restaurants button */
    [_allButton sendActionsForControlEvents:UIControlEventTouchDown];
    self.searchDisplayController.displaysSearchBarInNavigationBar = YES;
    
    resultSearch = [[NSArray alloc] init];
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 0, self.view.bounds.size.height * 0.1)];
    [searchBar setDelegate:self];
    _table.tableHeaderView = searchBar;
    
    /** the most shitty code */
    arraySize = [_data count];
    
    
    [_table setDelegate:self];
    [_table setDataSource:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *) applicationDocumentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}

- (void)getAllData
{
    NSString *documents = [self applicationDocumentsDirectory];
    NSString *dbPath = [documents stringByAppendingPathComponent:@"default.db"];
    
    SQLManager * localManager = [[SQLManager alloc] initWithFileName:dbPath];
    _data = [localManager getFields:@"name" inTable:@"ch_restaurant" forPrimeKey:@"id"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(resultSearch.count > 0 )
    {
        return [resultSearch count];
    }
    else
    {
        //return [_data count];
        return arraySize;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /** Need to fetch some data from DB */
    SpecificViewController * specController = [[SpecificViewController alloc] init];
    [self.navigationController pushViewController:specController animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _data = [NSMutableArray arrayWithObjects:[[Restaurant alloc] initWithCode:@"1" name:@"KFC"], [[Restaurant alloc] initWithCode:@"2" name:@"McDonalds"], [[Restaurant alloc] initWithCode:@"3" name:@"BurgerKing"], [[Restaurant alloc] initWithCode:@"4" name:@"CurryWurst"], nil];
    static NSString * cellIdentifier = @"MyCell";
    
    RestCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil)
    {
        cell = [[[RestCell alloc] initWithFrame:CGRectZero reuseIdentifier:cellIdentifier] autorelease];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    Restaurant * title = nil;
    
    if(resultSearch.count > 0)
    {
        title = [resultSearch objectAtIndex:indexPath.row];
    }
    else
    {
        title = [_data objectAtIndex:indexPath.row];
    }

    cell.primaryLabel.text = title.name;

    NSString * path = [[NSBundle mainBundle] pathForResource:@"1Res" ofType:@"png"];
    UIImage * theImage = [UIImage imageWithContentsOfFile:path];
    
    cell.cellsImage.image = theImage;
    
    return cell;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
