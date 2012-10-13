//
//  RecipeDetailViewController.m
//  HomeBrewTimer
//
//  Created by Russ Davis on 10/13/12.
//  Copyright (c) 2012 RTB. All rights reserved.
//

#import "RecipeDetailViewController.h"
#import "Recipe.h"

@interface RecipeDetailViewController ()

@end

@implementation RecipeDetailViewController

@synthesize delegate = _delegate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) [self.nameTextField becomeFirstResponder];
    
}

- (IBAction)done:(id)sender {
    Recipe *recipe = [[Recipe alloc] init];
    recipe.name = self.nameTextField.text;
    recipe.desc = @"This is just a placeholer";
    recipe.boilLength = 60;
    [self.delegate recipeDetailViewController:self didAddRecipe:recipe];
}

- (IBAction)cancel:(id)sender {
    [self.delegate recipeDetailViewControllerDidCancel:self];
}
@end
