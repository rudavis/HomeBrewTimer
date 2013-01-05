//
//  RecipeTimerViewController.h
//  HomeBrewTimer
//
//  Created by Russ Davis on 12/31/12.
//  Copyright (c) 2012 RTB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecipesViewController.h"

@class RecipeTimerViewController;

/*
@protocol RecipeTimerViewControllerDelegate <NSObject>
-(void)timerDidFinish:(RecipesViewController)controller;
@end
*/

@interface RecipeTimerViewController : UIViewController

//@property (weak, nonatomic) id <RecipeTimerViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *description;
@property (strong, nonatomic) IBOutlet UILabel *timeRemaining;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *startButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *pauseButton;



- (IBAction)startTimerPressed:(id)sender;
- (IBAction)pauseTimerPressed:(id)sender;


@end


