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
@synthesize nameTextField = _nameTextField;
@synthesize descriptionTextField = _descriptionTextField;
@synthesize boilLengthTextField = _boilLengthTextField;
@synthesize inputAccView = _inputAccView;
@synthesize segmentedControl = _segmentedControl;
@synthesize activeTxtField = _activeTxtField;
@synthesize boilLengthButton = _boilLengthButton;
@synthesize recipe = _recipe;
@synthesize hopList = _hopList;

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

    self.tableView.backgroundColor=[UIColor clearColor];
    UIImage *backgroundImage = [UIImage imageNamed:@"beer_foam.jpg"];
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithImage:backgroundImage];
    self.tableView.backgroundView=backgroundImageView;
    
    _recipe = [[Recipe alloc] init];
    
    _hopList = [NSMutableArray arrayWithCapacity:10];

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
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 3, tableView.bounds.size.width - 10, 18)];
    
    label.text = [tableView.dataSource tableView:tableView titleForHeaderInSection:section];
    label.textColor = [UIColor whiteColor];
    [label setBackgroundColor:[UIColor clearColor]];
    [headerView addSubview:label];
    return headerView;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField {
    _activeTxtField = textField;
    [self createInputAccessoryView];
    [textField setInputAccessoryView:_inputAccView];
}

- (void) createInputAccessoryView
{
    _inputAccView = [[UIView alloc] initWithFrame:CGRectMake(10,0,310,42)];
    
    UIToolbar *keyboardToolbar = [[UIToolbar alloc] init];
    keyboardToolbar.barStyle = UIBarStyleBlackTranslucent;
    [keyboardToolbar sizeToFit];
    
    _segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Previous", @"Next", nil]];
    [_segmentedControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    [_segmentedControl addTarget:self action:@selector(nextPrevious:) forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem *nextPrevButton = [[UIBarButtonItem alloc] initWithCustomView:_segmentedControl];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(resignKeyboard)];
    
    NSArray *barItems = [NSArray arrayWithObjects:nextPrevButton, flexSpace, doneBtn, nil];
    [keyboardToolbar setItems:barItems];
    
    [_inputAccView addSubview:keyboardToolbar];
    
}

- (void) nextPrevious:(id) sender
{
    switch(_activeTxtField.tag) {
        case 1:
            //Recipe Name
            if (_segmentedControl.selectedSegmentIndex == 1){
                [_descriptionTextField becomeFirstResponder];
                _activeTxtField = _descriptionTextField;
            }
            break;
        case 2:
            //Recipe Description
            if (_segmentedControl.selectedSegmentIndex == 0){
                [_nameTextField becomeFirstResponder];
                _activeTxtField = _nameTextField;
            }
        default:
            break;
    }
}

- (void) resignKeyboard
{
    [_activeTxtField resignFirstResponder];
}


- (IBAction)touchBoilLengthTextField:(id)sender {
    self.actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                     destructiveButtonTitle:nil
                                          otherButtonTitles:nil];
    
    [self.actionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    
    UIDatePicker *theDatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0.0, 44.0, 0, 0)];
    theDatePicker.datePickerMode = UIDatePickerModeCountDownTimer;
    theDatePicker.countDownDuration = 3600;
    
    self.timerPicker = theDatePicker;
    [self.timerPicker addTarget:self
     //action:nil
                         action:@selector(timerChanged:)
               forControlEvents:UIControlEventValueChanged];
    
    UIToolbar *pickerDateToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    pickerDateToolbar.barStyle = UIBarStyleBlackOpaque;
    [pickerDateToolbar sizeToFit];
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    UIBarButtonItem *barTitle = [[UIBarButtonItem alloc] initWithTitle:@"Set Boil Length" style:UIBarButtonItemStylePlain target:self action:nil];
    [barItems addObject:barTitle];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexSpace];
    
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(DatePickerDoneClick)];
    [barItems addObject:doneBtn];
    
    [pickerDateToolbar setItems:barItems animated:YES];
    
    [self.actionSheet addSubview:pickerDateToolbar];
    [self.actionSheet addSubview:self.timerPicker];
    [self.actionSheet showInView:self.view];
    [self.actionSheet setBounds:CGRectMake(0, 0, 320, 464)];
}

-(void) DatePickerDoneClick {
    [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
//    NSInteger min;
    _recipe.boilLength = _timerPicker.countDownDuration / 60;
//    min = self.timerPicker.countDownDuration / 60;
    [self.boilLengthButton setTitle:[NSString stringWithFormat:@"%2d Minutes", _recipe.boilLength] forState:0];
}

-(void) timerChanged:(id)sender {
    
}

- (IBAction)done:(id)sender {
    _recipe.name = self.nameTextField.text;
    _recipe.desc = self.descriptionTextField.text;
    [self.delegate recipeDetailViewController:self didAddRecipe:_recipe];
}

- (IBAction)cancel:(id)sender {
    [self.delegate recipeDetailViewControllerDidCancel:self];
}

- (void) addHopsViewControllerDidCancel:(AddHopsViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) addHopsViewController:(AddHopsViewController *)controller didAddHop:(Hop *)hop {
    
    NSLog(@"Hop name:  %@", hop.name);
    NSLog(@"Hop name:  %@", hop.weight);
    NSLog(@"Hop name:  %@", hop.addTime);
    
    NSLog(@"HopList Array: %@", self.hopList);
    
    [_hopList addObject:hop];

    NSLog(@"Added Hop so the HopList Array is now: %@", self.hopList);

/*
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.hopList count] - 1
                                                inSection:2];
    
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                          withRowAnimation:UITableViewRowAnimationNone];

    [self dismissViewControllerAnimated:YES
                             completion:nil];
*/
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"RecipeAddHops"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        AddHopsViewController *addHopsViewController = [[navigationController viewControllers] objectAtIndex:0];
        addHopsViewController.delegate = self;
    }
}

@end
