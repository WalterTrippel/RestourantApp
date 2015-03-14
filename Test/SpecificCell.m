//
//  SpecificCell.m
//  Test
//
//  Created by Admin on 14.03.15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import "SpecificCell.h"

@implementation SpecificCell

@synthesize primaryLabel, secondaryLabel, cellsImage;

-(id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier])
    {
        primaryLabel = [[UILabel alloc]init];
        primaryLabel.textAlignment = UITextAlignmentLeft;
        primaryLabel.font = [UIFont systemFontOfSize:14];
        secondaryLabel = [[UILabel alloc]init];
        secondaryLabel.textAlignment = UITextAlignmentLeft;
        secondaryLabel.font = [UIFont systemFontOfSize:8];
        cellsImage = [[UIImageView alloc]init];
        [self.contentView addSubview:primaryLabel];
        [self.contentView addSubview:secondaryLabel];
        [self.contentView addSubview:cellsImage];
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    UIView * selectedBackgroundView = [[UIView alloc] init];
    [selectedBackgroundView setBackgroundColor:[UIColor colorWithRed:0.0 green:(239 / 255.0) blue:1.0 alpha:1]];
    [self setSelectedBackgroundView:selectedBackgroundView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    
    CGRect frame;
    frame = CGRectMake(contentRect.size.width * 0.05, 0, contentRect.size.width * 0.15, contentRect.size.height);
    cellsImage.frame = frame;
    
    frame = CGRectMake(boundsX + contentRect.size.width * 0.25, 3, contentRect.size.width * 0.5, contentRect.size.height);
    primaryLabel.frame = frame;
    
    frame = CGRectMake(boundsX + 70, 30, 100, 15);
    secondaryLabel.frame = frame;
    
}


@end
