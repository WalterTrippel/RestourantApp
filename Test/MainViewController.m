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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _table = [[MainTableView alloc] init];
    _table.frame = self.view.bounds;

    _data = [NSMutableArray arrayWithObjects:@"First", @"First", @"First", @"First", @"First", @"First", @"First", @"First", @"First", @"First", @"First", @"First", nil];
    
    [self.view addSubview:_table];
    
    _allButton = [[[AllRestaurantButton alloc] init] autorelease];
    _allButton.frame = CGRectMake(0, self.view.bounds.size.height * 0.75, self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.14);
    [self.view addSubview:_allButton];
    
    _specButton = [[[SpecificRestaurantButton alloc] init] autorelease];
    _specButton.frame = CGRectMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.75, self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.14);
    [self.view addSubview:_specButton];
    
    [_table setDelegate:self];
    [_table setDataSource:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_data count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /** Need to fetch some data from DB */
    SpecificViewController * specController = [[SpecificViewController alloc] init];
    [self.navigationController pushViewController:specController animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _data = [NSMutableArray arrayWithObjects:@"First", @"First", @"First", @"First", @"First", @"First", @"First", @"First", @"First", @"First", @"First", @"First", nil];
    
    static NSString * cellIdentifier = @"MyCell";
    
    RestCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil)
    {
        cell = [[[RestCell alloc] initWithFrame:CGRectZero reuseIdentifier:cellIdentifier] autorelease];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    cell.primaryLabel.text = [_data objectAtIndex:indexPath.row];

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
