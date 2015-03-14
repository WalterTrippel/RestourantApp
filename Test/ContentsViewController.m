//
//  ContentsViewController.m
//  Test
//
//  Created by Admin on 14.03.15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import "ContentsViewController.h"
#import "SpecificCell.h"

@interface ContentsViewController ()

@end

@implementation ContentsViewController

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
        
        self.navigationItem.title = @"Contents";
        
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_data count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _data = [NSMutableArray arrayWithObjects:@"Third", @"Third", @"Third", @"Third", @"Third", @"Third", @"Third", @"Third", @"Third", nil];
    
    static NSString * cellIdentifier = @"MyCell";
    
    SpecificCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil)
    {
        cell = [[[SpecificCell alloc] initWithFrame:CGRectZero reuseIdentifier:cellIdentifier] autorelease];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if(_data.count > [indexPath row])
    {
        cell.primaryLabel.text = [_data objectAtIndex:indexPath.row];
    }
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"1Res" ofType:@"png"];
    UIImage * theImage = [UIImage imageWithContentsOfFile:path];
    
    cell.cellsImage.image = theImage;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    SpecificCell * cell = (SpecificCell *)[_table cellForRowAtIndexPath:indexPath];
    [self setCellColor:[UIColor blueColor] ForCell:cell];
}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    SpecificCell * cell = (SpecificCell *)[_table cellForRowAtIndexPath:indexPath];
    [self setCellColor:[UIColor whiteColor] ForCell:cell];
}

- (void)setCellColor:(UIColor *)color ForCell:(UITableViewCell *)cell
{
    cell.contentView.backgroundColor = color;
    cell.backgroundColor = color;
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
