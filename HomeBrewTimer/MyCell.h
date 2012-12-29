//
//  MyCell.h
//  HomeBrewTimer
//
//  Created by Russ Davis on 12/28/12.
//  Copyright (c) 2012 RTB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *recipeName;
@property (strong, nonatomic) IBOutlet UILabel *recipeDescription;
@property (strong, nonatomic) IBOutlet UILabel *additions;
@property (strong, nonatomic) IBOutlet UILabel *recipeBoilLength;

@end
