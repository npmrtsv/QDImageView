//
//  ImageTableViewCell.m
//  QDImageViewExample
//
//  Created by Nikolay on 14/04/14.
//
//

#import "ImageTableViewCell.h"

@implementation ImageTableViewCell

+ (NSString *)reuseID{
    return @"ImageTableViewCell";
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
