//
//  RecipeTimerViewController.m
//  HomeBrewTimer
//
//  Created by Russ Davis on 12/31/12.
//  Copyright (c) 2012 RTB. All rights reserved.
//

#import "RecipeTimerViewController.h"

@interface RecipeTimerViewController ()

@end

@implementation RecipeTimerViewController

@synthesize name = _name;
@synthesize description = _description;
@synthesize timeRemaining = _timeRemaining;
@synthesize startButton = _startButton;
@synthesize pauseButton = _pauseButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startTimerPressed:(id)sender {
}

- (IBAction)pauseTimerPressed:(id)sender {
}
@end
