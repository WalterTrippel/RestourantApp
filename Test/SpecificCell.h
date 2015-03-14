//
//  SpecificCell.h
//  Test
//
//  Created by Admin on 14.03.15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpecificCell : UITableViewCell
{
    UILabel * primaryLabel;
    UILabel * secondaryLabel;
    UIImageView * cellsImage;
}

@property(nonatomic, strong)UILabel * primaryLabel;
@property(nonatomic, strong)UILabel * secondaryLabel;
@property(nonatomic, strong)UIImageView * cellsImage;

@end
