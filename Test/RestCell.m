//
//  RestCell.m
//  Test
//
//  Created by User on 13/03/2015.
//  Copyright (c) 2015 User. All rights reserved.
//

#import "RestCell.h"

@implementation RestCell

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

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
    
    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGFloat boundsY = contentRect.origin.y;
    
    CGRect frame;
    frame = CGRectMake(contentRect.size.width * 0.05, 0, contentRect.size.width * 0.15, contentRect.size.height);
    cellsImage.frame = frame;
    
    frame = CGRectMake(boundsX + contentRect.size.width * 0.25, 3, contentRect.size.width * 0.5, contentRect.size.height);
    primaryLabel.frame = frame;
    
    frame = CGRectMake(boundsX + 70, 30, 100, 15);
    secondaryLabel.frame = frame;

}

@end
