//
//  RecipesViewController.h
//  HomeBrewTimer
//
//  Created by Russ Davis on 10/12/12.
//  Copyright (c) 2012 RTB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecipeDetailViewController.h"

@interface RecipesViewController : UITableViewController <RecipeDetailViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *recipes;

@end
