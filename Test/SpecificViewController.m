//
//  SpecificViewController.m
//  Test
//
//  Created by Admin on 14.03.15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import "SpecificViewController.h"
#include "MainViewController.h"
#include "ContentsViewController.h"

@interface SpecificViewController ()

@end

@implementation SpecificViewController
{
    NSUInteger arraySize;
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

-(void) likeAction
{
    UIBarButtonItem * likeButton = [[UIBarButtonItem alloc] initWithTitle:@"\u2605" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = likeButton;
    [likeButton release];
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Restaurant is marked." message:@"It will be stored at the liked ones." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        _table = [[MainTableView alloc] init];
        _table.frame = self.view.bounds;
        
        [self.view addSubview:_table];
        
        NSString * backArrayString = @"\U000025C0\U0000FE0E";
        UIBarButtonItem * delButton = [[UIBarButtonItem alloc] initWithTitle:backArrayString style:UIBarButtonItemStylePlain target:self action:@selector(delItemFromArray)];
        self.navigationItem.leftBarButtonItem = delButton;
        [delButton release];
        
        UIBarButtonItem * likeButton = [[UIBarButtonItem alloc] initWithTitle:@"\u2606" style:UIBarButtonItemStylePlain target:self action:@selector(likeAction)];
        self.navigationItem.rightBarButtonItem = likeButton;
        [likeButton release];
        
        self.navigationItem.title = @"Menu";
        
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
        
        /** stubby stub */
        arraySize = [_data count];
        
        [_table setDelegate:self];
        [_table setDataSource:self];
    }
    return self;
}

- (void) delItemFromArray{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _data = [NSMutableArray arrayWithObjects:@"Second", @"Second", @"Second", @"Second", @"Second", @"Second", @"Second", @"Second", @"Second", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arraySize;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContentsViewController * contController = [[ContentsViewController alloc] init];
    [self.navigationController pushViewController:contController animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _data = [NSMutableArray arrayWithObjects:@"Second", @"Second", @"Second", @"Second", @"Second", @"Second", @"Second", @"Second", @"Second", nil];
    
    static NSString * cellIdentifier = @"MyCell";
    
    SpecificCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil)
    {
        cell = [[[SpecificCell alloc] initWithFrame:CGRectZero reuseIdentifier:cellIdentifier] autorelease];
        
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
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
