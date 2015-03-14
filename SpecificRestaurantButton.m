//
//  SpecificRestaurantButton.m
//  Test
//
//  Created by Admin on 14.03.15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import "SpecificRestaurantButton.h"

@implementation SpecificRestaurantButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImage * backgroundIm = [UIImage imageNamed:@"like.png"];
        [self setImage:backgroundIm forState:UIControlStateNormal];
        
        CGFloat top = self.imageView.image.size.height * 0.5;
        CGFloat left = self.imageView.image.size.width * 0.5;
        CGFloat bottom = self.imageView.image.size.height * 0.5;
        CGFloat right = self.imageView.image.size.width * 0.5;
        self.imageEdgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
        
        
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
