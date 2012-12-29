//
//  MyCell.m
//  HomeBrewTimer
//
//  Created by Russ Davis on 12/28/12.
//  Copyright (c) 2012 RTB. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

@synthesize recipeName = _recipeName;
@synthesize recipeDescription = _recipeDescription;
@synthesize recipeBoilLength = _recipeBoilLength;
@synthesize additions = _additions;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
