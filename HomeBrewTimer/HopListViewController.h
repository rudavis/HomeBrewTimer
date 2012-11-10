//
//  HopListViewController.h
//  HomeBrewTimer
//
//  Created by Russ Davis on 11/10/12.
//  Copyright (c) 2012 RTB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HopListViewController;

@protocol HopListViewControllerDelegate <NSObject>
- (void)hopListViewControllerDidCancel:(HopListViewController *) controller;
//- (void)hopListViewController:(RecipeDetailViewController *) controller didAddRecipe:(Recipe *)recipe;
@end


@interface HopListViewController : UITableViewController


@property (strong,nonatomic) id <HopListViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;

@end
