//
//  RecipeDetailViewController.h
//  HomeBrewTimer
//
//  Created by Russ Davis on 10/13/12.
//  Copyright (c) 2012 RTB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"
//#import "HopListViewController.h"
#import "AddHopsViewController.h"

@class RecipeDetailViewController;

@protocol RecipeDetailViewControllerDelegate <NSObject>
- (void)recipeDetailViewControllerDidCancel:(RecipeDetailViewController *) controller;
- (void)recipeDetailViewController:(RecipeDetailViewController *) controller didAddRecipe:(Recipe *)recipe;
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
@end


@interface RecipeDetailViewController : UITableViewController <AddHopsViewControllerDelegate, UITextFieldDelegate>

@property (strong,nonatomic) id <RecipeDetailViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;
@property (strong, nonatomic) IBOutlet UITextField *boilLengthTextField;
@property (strong, nonatomic) UIView *inputAccView;
@property (strong, nonatomic) UISegmentedControl *segmentedControl;
@property (strong, nonatomic) UITextField *activeTxtField;
@property (strong, nonatomic) UIActionSheet *actionSheet;
@property (strong, nonatomic) UIDatePicker *timerPicker;
@property (strong, nonatomic) IBOutlet UIButton *boilLengthButton;
@property (strong, nonatomic) Recipe *recipe;
@property (strong, nonatomic) NSMutableArray *hopList;

- (IBAction)done:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)touchBoilLengthTextField:(id)sender;


@end
