//
//  ContentsViewController.h
//  Test
//
//  Created by Admin on 14.03.15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTableView.h"

@interface ContentsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) MainTableView * table;
@property(atomic, strong) NSMutableArray * data;

@end
