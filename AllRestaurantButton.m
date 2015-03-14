//
//  AllRestaurantButton.m
//  Test
//
//  Created by Admin on 14.03.15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import "AllRestaurantButton.h"

@implementation AllRestaurantButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor redColor];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.text = @"All";
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
