//
//  MainViewController.h
//  Test
//
//  Created by User on 13/03/2015.
//  Copyright (c) 2015 User. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTableView.h"
#import "RestCell.h"
#import "SpecificViewController.h"
#import "AllRestaurantButton.h"
#import "SpecificRestaurantButton.h"


@interface MainViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) MainTableView * table;
@property(atomic, strong) NSMutableArray * data;
@property(nonatomic, strong) AllRestaurantButton * allButton;
@property(nonatomic, strong) SpecificRestaurantButton * specButton;

@end
