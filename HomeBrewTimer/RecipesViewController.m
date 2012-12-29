//
//  RecipesViewController.m
//  HomeBrewTimer
//
//  Created by Russ Davis on 10/12/12.
//  Copyright (c) 2012 RTB. All rights reserved.
//

#import "RecipesViewController.h"
#import "Recipe.h"
#import "MyCell.h"

@interface RecipesViewController ()

@end

@implementation RecipesViewController

@synthesize recipes = _recipes;

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

    //Set the tableView background image
    self.tableView.backgroundColor=[UIColor clearColor];
    UIImage *backgroundImage = [UIImage imageNamed:@"beer_foam.jpg"];
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithImage:backgroundImage];
    self.tableView.backgroundView=backgroundImageView;
    
    self.recipes = [[NSMutableArray alloc] init];
    Recipe *recipe1 = [[Recipe alloc] init];
    [recipe1 setName:@"Best IPA"];
    [recipe1 setDesc:@"Name says it all"];
    [recipe1 setBoilLength:60];
    [self.recipes addObject:recipe1];
    
    Recipe *recipe2 = [[Recipe alloc]init];
    [recipe2 setName:@"Number 2"];
    [recipe2 setDesc:@"yepyep"];
    [recipe2 setBoilLength:90];
    [self.recipes addObject:recipe2];
    
    
    //Trying to get the table cells opaque
    //Not sure if these are necessary
//    self.tableView.backgroundColor = [UIColor clearColor];
//    self.tableView.opaque = NO;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    //return 1;
    
    return [self.recipes count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [self.recipes count];
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"MyCell";
    MyCell *cell = (MyCell *) [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MyCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }

    //Sets the cell background color to transparent
    cell.backgroundColor = [UIColor colorWithWhite:.75 alpha:.55];
    
    cell.recipeName.text = [[self.recipes objectAtIndex:indexPath.section] name];
    cell.recipeDescription.text = [[self.recipes objectAtIndex:indexPath.section] desc];
    cell.recipeBoilLength.text = [NSString stringWithFormat:@"%i", [[self.recipes objectAtIndex:indexPath.section] boilLength]];
    
    return cell;
    
    
/*
 //
 //This section works with the default prototype
 //
    static NSString *cellIdentifier = @"RecipeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [[self.recipes objectAtIndex:indexPath.row] name];
    cell.detailTextLabel.text = [[self.recipes objectAtIndex:indexPath.row] desc];

    return cell;
 
*/
}

- (void) recipeDetailViewControllerDidCancel:(RecipeDetailViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) recipeDetailViewController:(RecipeDetailViewController *)controller didAddRecipe:(Recipe *)recipe {
    [self.recipes addObject:recipe];
//TODO:  Replace Rows with Sections.
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.recipes count] -1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddRecipe"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        RecipeDetailViewController *recipeDetailViewController = [[navigationController viewControllers] objectAtIndex:0];
        recipeDetailViewController.delegate = self;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
/*
    RecipeDetailViewController *recipeDetailViewController = [[RecipeDetailViewController alloc] initWithNibName:@"RecipeDetailViewController" bundle:[NSBundle mainBundle]];

    [self.navigationController pushViewController:recipeDetailViewController animated:YES];
*/

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

@end
