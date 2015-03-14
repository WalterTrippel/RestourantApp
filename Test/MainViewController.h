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
#include "SpecificViewController.h"


@interface MainViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) MainTableView * table;
@property(atomic, strong) NSMutableArray * data;

@end
