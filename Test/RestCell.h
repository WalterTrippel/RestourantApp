//
//  RestCell.h
//  Test
//
//  Created by User on 13/03/2015.
//  Copyright (c) 2015 User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestCell : UITableViewCell
{
    UILabel * primaryLabel;
    UILabel * secondaryLabel;
    UIImageView * cellsImage;
}

@property(nonatomic, retain)UILabel * primaryLabel;
@property(nonatomic, retain)UILabel *secondaryLabel;
@property(nonatomic, retain)UIImageView * cellsImage;


@end
