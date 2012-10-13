//
//  RecipeDetailViewController.h
//  HomeBrewTimer
//
//  Created by Russ Davis on 10/13/12.
//  Copyright (c) 2012 RTB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"

@class RecipeDetailViewController;

@protocol RecipeDetailViewControllerDelegate <NSObject>
- (void)recipeDetailViewControllerDidCancel:(RecipeDetailViewController *) controller;
- (void)recipeDetailViewController:(RecipeDetailViewController *) controller didAddRecipe:(Recipe *)recipe;
@end


@interface RecipeDetailViewController : UITableViewController

@property (nonatomic, weak) id <RecipeDetailViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;

- (IBAction)done:(id)sender;
- (IBAction)cancel:(id)sender;


@end
