//
//  AppDelegate.h
//  Test
//
//  Created by User on 12/03/2015.
//  Copyright (c) 2015 User. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow * window;
@property (strong, nonatomic) UINavigationController * navController;
@property (strong, nonatomic) MainViewController * mainController;
@property (strong, nonatomic) UIImage * topImage;


@end

