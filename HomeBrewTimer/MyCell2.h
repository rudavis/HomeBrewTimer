//
//  MyCell2.h
//  HomeBrewTimer
//
//  Created by Russ Davis on 12/29/12.
//  Copyright (c) 2012 RTB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell2 : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *cellRecipeName;
@property (strong, nonatomic) IBOutlet UILabel *cellRecipeBoilLength;
@property (strong, nonatomic) IBOutlet UILabel *cellRecipeDescription;
@property (strong, nonatomic) IBOutlet UILabel *cellRecipeAdditions;

@end
