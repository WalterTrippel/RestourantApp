//
//  SpecificViewController.h
//  Test
//
//  Created by Admin on 14.03.15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "MainTableView.h"
#include "SpecificCell.h"
#import "AllRestaurantButton.h"
#import "SpecificRestaurantButton.h"

@interface SpecificViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) MainTableView * table;
@property(atomic, strong) NSMutableArray * data;
@property(nonatomic, strong) AllRestaurantButton * allButton;
@property(nonatomic, strong) SpecificRestaurantButton * specButton;

@end
