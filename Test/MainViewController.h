//
//  MainViewController.h
//  Test
//
//  Created by User on 13/03/2015.
//  Copyright (c) 2015 User. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTableView.h"
#include "RestCell.h"


@interface MainViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property(strong) MainTableView * table;
@property(strong, retain) NSArray * data;

@end
